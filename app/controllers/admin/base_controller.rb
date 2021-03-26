class Admin::BaseController < ApplicationController
  # before_action :restricting_user_access
before_action :authenticate_user!

  layout "admin"


end
