class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    return @current_user if @current_user

    # for development: if user was deleted without deleting session
    user = nil

    if session[:user_id]
      user = User.find_by id: session[:user_id]
      session[:user_id] = nil if user.nil?
    end

    @current_user ||= user
  end

  helper_method :current_user
end
