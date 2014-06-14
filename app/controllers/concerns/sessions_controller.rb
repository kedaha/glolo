class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.oauth_find_or_create(auth_hash, current_user)
    session[:user_id] = @user.id
    if @user
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
