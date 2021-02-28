class BookingsController < ApplicationController
  def show
    @booking = Booking.all
  end

  def new
    @booking  = Booking.new
    @locations = Location.all
    @services = Service.all
    @hairdressers = Hairdresser.all
  end

  def create
    @booking  = Booking.new(booking_params)

    if @booking.save
      redirect_to bookings_url, notice: "Онлайн запись прошла успешно"
    else
      render action: 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:location_id,
                                    :service_id,
                                    :hairdresser_id,
                                    :first_name,
                                    :last_name,
                                    :dateandtime,
                                    :phone_num,
                                    :note)
  end
end
