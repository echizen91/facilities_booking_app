class Room < ApplicationRecord
    has_many :bookings
    validates :location, presence: true, uniqueness: true
    validates :capacity, presence: true
    validates :classification, presence: true
end
