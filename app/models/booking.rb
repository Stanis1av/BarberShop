class Booking < ApplicationRecord
  has_one :location
  accepts_nesteed_attributes_for :location
end
