class Location < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def google_map(center)
    "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=500x500&zoom=17&key=#{Rails.application.credentials.name_you_choose}"
end
end
