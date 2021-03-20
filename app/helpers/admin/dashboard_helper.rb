module Admin::DashboardHelper
  def booking_last_update
    if @bookings.empty?
      0
    else
      @bookings.last.updated_at
    end
  end

  def user_last_update
    if @users.empty?
      0
    else
      @users.last.updated_at
    end
  end
end
