class BookingsController < ApplicationController
  load_and_authorize_resource
  def show
    @booking = Booking.all
  end

  def new
    # if current_user.superadmin_role?
    @booking  = Booking.new
    @locations = Location.all
    @services = Service.all
    @hairdressers = Hairdresser.all
    # else
    #   redirect_to root_path, notice: "Недостаточно прав доступа"
    # end
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
