class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def show
  end

  def new
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
  end

  private

  def user_params
    params.require(:user).permit( :id,
                                  :email,
                                  :encrypted_password,
                                  :reset_password_token,
                                  :reset_password_sent_at,
                                  :remember_created_at,
                                  :created_at,
                                  :updated_at,
                                  :username,
                                  :superadmin_role,
                                  :supervisor_role,
                                  :salon_manager_role,
                                  :user_role)
  end

end
