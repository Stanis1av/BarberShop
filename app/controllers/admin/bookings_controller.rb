class Admin::BookingsController < Admin::BaseController
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
