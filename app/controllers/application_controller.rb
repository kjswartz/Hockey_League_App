class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user

  def authenticate_admin_user!
    redirect_to root_path unless current_user.try(:admin)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  helper_method :signed_in?, :current_user

  def signed_in?
    return true if current_user.present?
  end

end
