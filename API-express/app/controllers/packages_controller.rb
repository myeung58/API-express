class PackagesController < ApplicationController
  protect_from_forgery
  include ApiHelper
  def new
  end

  def create
    @user = User.find(params[:user_id])
    api_helper(@user.id, params[:api], params[:auth_key], params[:client_key])
    redirect_to user_path(@user)
  end

  def yo
    @user = User.find(params[:user_id])
    @name = params[:action]
    @package = Package.new
    render partial: "form"
  end

  def twitter
    @user = User.find(params[:user_id])
    @name = params[:action]
    @package = Package.new
    render partial: "form"
  end

end