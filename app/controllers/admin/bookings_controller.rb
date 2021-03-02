class Admin::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
