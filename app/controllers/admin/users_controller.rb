class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    if @users.save
      redirect_to admin_users_url, notice: "Пользователь успешно создан (админ)"
    else
      render action: 'new', alert: "Создание нового пользователя провалилось (админ)"
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @users = User.find(params[:id])

    if @users.update(user_params)
      redirect_to admin_users_url, notice: "Успешно отредактированно!"
    else
      redirect_to admin_users_url, alert: "Не удалось отредактировать объект"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_url, notice: "Успешно удалено!"
    else
      redirect_to admin_users_url, alert: "Не удалось удалить объект"
    end
  end

  private

  def user_params
    params.require(:user).permit( :id,
                                  :email,
                                  :username,
                                  :password,
                                  :password_confirmation,
                                  :created_at,
                                  :updated_at,
                                  :role)

  end

end
