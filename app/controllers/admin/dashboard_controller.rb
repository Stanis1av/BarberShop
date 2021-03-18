class Admin::DashboardController < Admin::BaseController
  def index
    @bookings = Booking.all
    @users = User.all
  end
end
