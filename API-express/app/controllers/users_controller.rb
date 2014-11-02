class UsersController < ApplicationController
  protect_from_forgery
  before_filter :all_packages
  def index
    @user = User.new
  end

  def create
    @user = User.create(person_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "Try Again."
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @packages = @user.packages
    @selected_packages = []
    @packages.each do |package|
      @selected_packages << package.api
    end
    @available_packages = @all_packages.select { |package| !@selected_packages.include?(package)}
    p @all_packages
    p @available_packages

  end

  private

  def all_packages
    @all_packages = ["Yo", "Twitter"]
  end

  def person_params
    params.require(:user).permit(:username, :password)
  end
end
