class BookingsController < ApplicationController
  def show
    @booking = Booking.all
  end

  def new
    @booking  = Booking.new
    @location = Location.all
  end

  def create
    @booking  = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_url
    else
      render action: 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:location_id, :first_name, :last_name, :dateandtime, :phone_num, :note)
  end
end
