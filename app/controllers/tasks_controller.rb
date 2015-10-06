class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: [:edit, :update, :toggle, :destroy]

  def index
    @tasks = @user.tasks
  end

  def new
    @task = @user.tasks.new
  end

  def create
    @task = @user.tasks.new(task_params)
    @task.save
  end

  def edit
  end

  def update
    @task.update(task_params)
  end

  def toggle
    @task.toggle_completed_at
  end

  def sort
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
     params.require(:task).permit(:description)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = @user.tasks.where(id: params[:id]).first
  end

end
