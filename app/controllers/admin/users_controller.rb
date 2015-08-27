class Admin::UsersController < ApplicationController
  before_action :only_for_admin?
  def index
    @users = User.all
  end

  private

  def only_for_admin?
    redirect_to tasks_url, alert: "Only admin have access" unless current_user.is_admin?
  end
end