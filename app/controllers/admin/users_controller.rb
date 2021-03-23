class Admin::UsersController < Admin::BaseController
  load_and_authorize_resource
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)

    if @users.save
      redirect_to admin_users_url, notice: "Пользователь успешно создан (админ)"
    else
      render admin_users_url, alert: "Создание нового пользователя провалилось (админ)"
    end
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    if successfully_updated
      redirect_to admin_users_url, notice: 'Пользователь был успешно обновлён'
    else
      render :edit, alert: 'Не удалось обновить пользователя'
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

  def needs_password?(_user, params)
    params[:password].present?
  end

  def update_without_password(user_params)
    user.update_without_password(user_params)
  end

  def user_params
    params.require(:user).permit( :email,
                                  :username,
                                  :password,
                                  :password_confirmation,
                                  :created_at,
                                  :updated_at,
                                  :role_id)

  end

end
