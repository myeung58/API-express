class PackagesController < ApplicationController
  protect_from_forgery
  include ApiHelper
  def new
  end

  def create
    p params
    # api_helper()
    @user = User.find(params[:user_id])
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