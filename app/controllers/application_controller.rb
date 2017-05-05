class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    uid = session[:user_id]

    return nil unless uid

    @current_user ||= User.where(id: uid).first
  end
end
