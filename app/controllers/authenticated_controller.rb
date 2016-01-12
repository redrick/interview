class AuthenticatedController < ApplicationController
  before_action :authenticate_user!

  def admin_required!
    unless current_user.admin?
      redirect_to root_path, status: 301, notice: "You must be logged as an admin!"
      return false
    end
  end
end
