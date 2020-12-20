class BookingsController < ApplicationController
  def new

  end

  def create
    @booking  = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render action: 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :hairdresser, :dateandtime, :phone_num)
  end
end
