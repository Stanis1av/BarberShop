class Admin::DashboardController < Admin::BaseController
  authorize_resource class: false
  def index
    @bookings = Booking.all

    @locations = Location.all
    @services = Service.all
    @hairdressers = Hairdresser.all

    @users = User.all

    @contacts = Contact.all
  end
end
