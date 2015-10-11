class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:edit, :update, :toggle, :destroy, :download_attachment, :destroy_attachment]

  def index
    @tasks = @user.tasks
  end

  def new
    @task = @user.tasks.new
  end

  def create
    @task = @user.tasks.new(task_params)
    @task.save
    respond_to do |format|
     format.html { redirect_to user_tasks_path(@user) }
     format.js
   end
  end

  def edit
  end

  def update
    @task.update(task_params)
    respond_to do |format|
     format.html { redirect_to user_tasks_path(@user) }
     format.js
   end
  end

  def destroy
    @task.destroy
  end

  def toggle
    @task.toggle_completed_at
  end

  def sort
    params[:order].each do |key, updated_order|
      task = @user.tasks.where(id: updated_order[:id]).first
      task.update_attribute(:order, updated_order[:position]) if task
    end
    render nothing: true
  end

  def download_attachment
    attachment = @task.attachment
    if attachment
      attachment = File.open(attachment.path, 'r')
      send_file attachment
    end
  end

  def destroy_attachment
    @task.destroy_attachment
  end

  private

  def task_params
     params.require(:task).permit(:description, :attachment)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = @user.tasks.where(id: params[:id]).first
  end

end
