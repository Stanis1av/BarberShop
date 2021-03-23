class Admin::BaseController < ApplicationController
  # before_action :restricting_user_access

  layout "admin"

  # def restricting_user_access
  #   if current_user.user_role?
  #     redirect_to root_path
  #   end

  #   # current_user.user_role? ? redirect_to root_path, alert: 'Доступ запрещён!'
  # end

end
