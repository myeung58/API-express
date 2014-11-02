class SessionsController < ApplicationController
  protect_from_forgery
  def new
  end

  def login
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :root
  end

end