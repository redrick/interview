class TodosController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @tasks = Task.includes(:category).where(user_id: current_user.id)
  end
end
