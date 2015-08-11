class UsersController < ApplicationController
  before_action :fetch_user, only: [:destroy, :edit, :show, :update]
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end
  
  def destroy
    begin
      @user.destroy
      redirect_to :users
    rescue Exception => e
      redirect_to @user
    end
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def update
    if @user.update_attributes(user_params(@user.type || 'User'))
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  
  def fetch_user
    @user = User.find(params[:id])
  end
  
  def user_params(type = 'User')
    params.require(type.downcase.to_sym).permit(:name, :surname, :email, :phone, :type)
  end
end
