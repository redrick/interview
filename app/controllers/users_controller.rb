
class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User successfully created."
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = "User successfully updated."
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "User successfully deleted."
    else
      flash[:error] = "Error occurred, user has not been deleted."
    end

    redirect_to users_path
  end


  private

  def user_params
    if params[:admin].present?
      type = 'Admin'
    elsif params[:manager].present?
      type = 'Manager'
    else
      type = 'User'
    end

    params.require(type.underscore.to_sym).permit(
                             :name,
                             :surname,
                             :email,
                             :phone,
                             :type
    )
  end

end