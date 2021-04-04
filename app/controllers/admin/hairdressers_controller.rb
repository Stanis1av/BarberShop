class Admin::HairdressersController < Admin::BaseController
  load_and_authorize_resource
  def index
    @hairdressers = Hairdresser.all
  end

  def show
    @hairdresser = Hairdresser.find(params[:id])
  end

  def new
    @location = Location.all
    @hairdresser = Hairdresser.new
  end

  def create
    @hairdresser = Hairdresser.new(hairdresser_params)

    if @hairdresser.valid?
      @hairdresser.save
      redirect_to admin_hairdressers_path, notice: 'Парикмахер успешно создан'
    else
      redirect_to admin_hairdressers_path, alert: 'Не удалось создать объект'
    end
  end

  def edit
    @hairdresser = Hairdresser.find(params[:id])
    @location = Location.all
  end

  def update
    @hairdresser = Hairdresser.find(params[:id])

    if @hairdresser.valid?
      @hairdresser.update(hairdresser_params)
      redirect_to admin_hairdressers_path, notice: 'Парикмахер успешно обновлен'
    else
      render action: 'edit', alert: 'Не удалось обновить парикмахера'
    end
  end

  def destroy
    @hairdresser = Hairdresser.find(params[:id])

    if @hairdresser.valid?
      @hairdresser.destroy
      redirect_to admin_hairdressers_path, notice: 'Успешно удалено'
    else
      render action: 'index', alert: 'Не удалось удалить парикмахера'
    end
  end

  private

  def hairdresser_params
    params.require(:hairdresser).permit(:name,
                                        :position,
                                        :description,
                                        :location_id)
  end

end
