class MoreThanValidator < ActiveModel::Validator
  def validate(record)
    if record.startdate < Time.new
      record.errors[:base] << "Time start cannot be earlier than current time"
    end
    if record.enddate <= record.startdate + 1740 
      record.errors[:base] << "Time end cannot be earlier than or equal to current time or lesser than 30mins of booking"
    end

    # Resolution is 1min
    start = record.startdate - 60
    final = record.enddate + 60

    # If current room booking exists startdate that is within the input startdate and end date within startdate

    # if current booking start date and enddate coincides with any booking within the day, reject
    # if any start date coincides with any booking within the day but end date outside, reject
    # if any end date conincides with any booking within the day but start date outside, reject
    @overlap = Booking.where('room_id = ? AND (startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', record.room_id, start, final, start, final)
    unless @overlap.empty?
      record.errors[:base] << "Room is unavailable at this time and day"
    end
    @overlapuser = Booking.where('user_id = ? AND (startdate BETWEEN ? AND ?) OR (enddate BETWEEN ? AND ?)', record.user_id, start, final, start, final)
    unless @overlapuser.empty?
      record.errors[:base] << "User has another booking at this time and day"
    end
  end
end

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates_associated :room
  validates_associated :user
  validates_with MoreThanValidator, fields:[:startdate, :enddate]
end
