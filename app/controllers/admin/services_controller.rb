class Admin::ServicesController < Admin::BaseController
  load_and_authorize_resource
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)

    if @service.valid?
      @service.save
      redirect_to admin_services_path, notice: 'Услуга успешно создана'
    else
      render action: 'new', alert: 'Не удалось создать объект'
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])

    if @service.valid?
      @service.update(service_params)
      redirect_to admin_services_path, notice: 'Услуга успешно обновлена'
    else
      render action: 'edit', alert: 'Не удалось обновить услугу'
    end
  end

  def destroy
    @service = Service.find(params[:id])

    if @service.valid?
      @service.destroy
      redirect_to admin_services_path, notice: 'Успешно удалено'
    else
      render action: 'index', alert: 'Не удалось удалить услугу'
    end
  end

  private

  def service_params
    params.require(:service).permit(:name,
                                    :price,
                                    :description)
  end

end
