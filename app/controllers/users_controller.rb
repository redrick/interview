
class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin, only: [:destroy]
  before_action :verify_not_self, only: [:destroy]

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = "User successfully updated."
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy

    # @user loaded in before filter

    if @user.destroy
      flash[:success] = "User successfully deleted."
    else
      flash[:danger] = "Error occurred, user has not been deleted."
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


  def verify_admin
    @user = User.find(params[:id])

    unless current_user.type == 'Admin'
      redirect_to root_url, flash: { danger: 'Not permitted, sorry.' }
    end
  end


  def verify_not_self
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to users_path, flash: { danger: 'Use Change Password option to destroy your account.' }
    end
  end

end