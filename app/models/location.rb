class Location < ApplicationRecord
  # belongs_to :booking
  has_many :hairdresser

  def city_and_branch_name
    "Город: #{city}, салон: #{branch_name}"
  end
end
