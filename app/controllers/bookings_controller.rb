class BookingsController < ApplicationController
  def show
    @booking = Booking.all
  end

  def new

  end

  def create
    @booking  = Booking.new(booking_params)
    @booking.hairdresser = params[:hairdresser]
    @booking.dateandtime = params[:dateandtime]

    if @booking.save
      redirect_to bookings_url
    else
      render action: 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:first_name, :last_name, :hairdresser, :dateandtime, :phone_num, :note)
  end
end
