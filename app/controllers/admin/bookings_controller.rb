class Admin::BookingsController < Admin::BaseController
  def index
    @bookings = Booking.all
  end

  def new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render action: 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render action: 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

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
