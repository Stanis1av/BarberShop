class LocationsController < ApplicationController

  def show
    @location = Location.all
  end
end
