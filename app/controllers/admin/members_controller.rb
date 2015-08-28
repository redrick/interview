class Admin::MembersController < ApplicationController
  before_action :only_for_admin?
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.all
  end

  def edit
    render :edit
  end

  def update
    respond_to do |format|
      if @user.update user_params
        format.html { redirect_to admin_members_path, notice: 'User was successfully updated.' }
      else
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(@user.class.to_s.underscore.to_sym).permit(:first_name, :last_name, :type, :email)
  end

  def only_for_admin?
    redirect_to tasks_url, alert: "Only admin have access" unless current_user.is_admin?
  end
end
