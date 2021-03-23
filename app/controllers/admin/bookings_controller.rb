class Admin::BookingsController < Admin::BaseController
  load_and_authorize_resource
  def index
    @bookings_admin = Booking.all
  end

  def new
    @bookings_admin = Booking.new
    @locations_admin = Location.all
    @services_admin = Service.all
    @hairdressers_admin = Hairdresser.all
  end

  def create
    @bookings_admin = Booking.new(booking_params)

    if @bookings_admin.save
      redirect_to admin_bookings_url, notice: "Онлайн запись прошла успешно (админ)"
    else
      render action: 'new', alert: "Онлайн запись провалилась (админ)"
    end
  end

  def show
    @booking_admin = Booking.find(params[:id])
  end

  def edit
    @booking_admin = Booking.find(params[:id])
    @locations_admin = Location.all
    @services_admin = Service.all
    @hairdressers_admin = Hairdresser.all
  end

  def update
    @booking_admin = Booking.find(params[:id])

    if @booking_admin.update(booking_params)
      redirect_to admin_bookings_url, notice: "Успешно отредактированно!"
    else
      redirect_to admin_bookings_url, alert: "Не удалось отредактировать объект"
    end
  end

  def destroy
    @booking_admin = Booking.find(params[:id])

    if @booking_admin.destroy
      redirect_to admin_bookings_url, notice: "Успешно удалено!"
    else
      redirect_to admin_bookings_url, alert: "Не удалось удалить объект"
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
