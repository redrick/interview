class TasksController < ApplicationController

  before_action :authenticate_user!

  respond_to :js
  
  def toggle
    id = params[:id]
    
    @task = Task.where(user_id: current_user.id, id: id).first
    
    if @task
      @task.update_attributes(done: !@task.done)
      respond_with @task
    end
  end
end
