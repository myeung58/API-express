class PackagesController < ApplicationController
  protect_from_forgery
  include ApiHelper
  def new
  end

  def create
    p params
    # api_helper
  end

  def yo
    @package = Package.new
  end

  def twitter
    p params
    @user = User.find(params[:user_id])
    @name = params[:action]
    @package = Package.new
    render partial: "form"
  end

end