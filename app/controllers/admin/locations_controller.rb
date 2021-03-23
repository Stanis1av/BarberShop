class Admin::LocationsController < Admin::BaseController
  load_and_authorize_resource
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.valid?
      @location.save
      redirect_to admin_locations_path, notice: 'Локация успешно создана'
    else
      render action: 'new', alert: 'Не удалось создать объект'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.valid?
      @location.update(location_params)
      redirect_to admin_locations_path, notice: 'Локация успешно обновлена'
    else
      render action: 'edit', alert: 'Не удалось обновить локацию'
    end
  end

  def destroy
    @location = Location.find(params[:id])

    if @location.valid?
      @location.destroy
      redirect_to admin_locations_path, notice: 'Успешно удалено'
    else
      render action: 'index', alert: 'Не удалось удалить локацию'
    end
  end

  private

  def location_params
    params.require(:location).permit(:city,
                                     :branch_name,
                                     :location)
  end

end
