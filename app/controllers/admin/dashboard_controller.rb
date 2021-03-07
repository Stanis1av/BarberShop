class Admin::DashboardController < Admin::BaseController
  def index
    @bookings = Booking.all
  end
end
