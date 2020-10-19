class MoreThanValidator < ActiveModel::Validator
  def validate(record)
    if record.startdate < Time.new
      record.errors[:base] << "Time start cannot be earlier than current time"
    end
    if record.enddate <= record.startdate + 1740 
      record.errors[:base] << "Time end cannot be earlier than or equal to current time or lesser than 30mins of booking"
    end
    @overlap = Booking.where('room_id = ? AND NOT (startdate BETWEEN ? AND ?) AND NOT (enddate BETWEEN ? AND ?)', record.room_id, record.startdate, record.enddate, record.startdate, record.enddate)
    unless @overlap.empty?
      record.errors[:base] << "Room is unavailable at this time and day"
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
