class Location < ApplicationRecord
  # belongs_to :booking
  has_many :hairdresser
  has_many :user

  def city_and_branch_name
    "Город: #{city}, салон: #{branch_name}"
  end

  def branch_names_for_creating_manager
  	"салон: #{branch_name}"
  end
end
