class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, except: [:home_page]

  def admin_permission
    if user_signed_in? && !current_user.admin
      redirect_to root_path, notice: '404 - Essa página não existe!'
    end
  end
end
