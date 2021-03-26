module Admin::DashboardHelper
  def booking_last_update
    if @bookings.empty?
      0
    else
      @bookings.last.updated_at
    end
  end

  def location_last_update
    if @locations.empty?
      0
    else
      @locations.last.updated_at
    end
  end

  def service_last_update
    if @services.empty?
      0
    else
      @services.last.updated_at
    end
  end

  def hairdresser_last_update
    if @hairdressers.empty?
      0
    else
      @hairdressers.last.updated_at
    end
  end

  def user_last_update
    if @users.empty?
      0
    else
      @users.last.updated_at
    end
  end

  def contact_last_update
    if @contacts.empty?
      0
    else
      @contacts.last.updated_at
    end
  end
end
