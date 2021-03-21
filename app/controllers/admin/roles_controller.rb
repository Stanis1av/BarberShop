class Admin::RolesController < Admin::BaseController
  def index
    @roles = Role.all
  end

  def new; end

  def create
    @role = Role.new(role_params)

    if @role.valid?
      @role.save
    else
      render action: 'new'
    end
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit; end

  def update
    @role = Role.find(params[:id])

    if @role.valid?
      @role.update(role_params)
    else
      render action: 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])

    if @role.destroy
      redirect_ro admin_role_url, notice: 'Роль успешно удалена!'
    else
      render action: 'index', alert: 'Не удалось удалить роль.'
    end
  end

  private

  def role_params
    params.require(:role).permit(:id,
                                 :var_name,
                                 :name,
                                 :description)
  end
end
