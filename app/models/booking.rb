class Booking < ApplicationRecord
  has_one :location # , inverse_of: :booking
  accepts_nested_attributes_for :location
  has_one :service # , inverse_of: :booking
  accepts_nested_attributes_for :service
  has_one :hairdresser # , inverse_of: :booking
  accepts_nested_attributes_for :hairdresser
end
