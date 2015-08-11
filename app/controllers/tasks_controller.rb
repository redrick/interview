class TasksController < ApplicationController
  before_action :fetch_user
  before_action :undone_tasks, only: :index
  before_action :fetch_task, only: [:destroy, :toggle_done, :edit, :show, :update]
  
  def create
    @task = Task.new(task_params)
    @task.user = @user
    if @task.save
      redirect_to [@user, @task], notice: 'Task successfully created.'
    else
      flash.now[:alert] = 'Task creation failed!'
      render :new
    end
  end
  
  def destroy
    begin
      @task.destroy
      redirect_to [@user, :tasks], notice: 'Task successfully destroyed.'
    rescue Exception => e
      redirect_to [@user, @task], alert: 'Task deletion failed!'
    end
  end
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def toggle_done
    @task.toggle!(:done)
  end
  
  def update
    if @task.update_attributes(task_params)
      redirect_to [@user, @task], notice: 'Task successfully updated.'
    else
      flash.now[:alert] = 'Task update failed!'
      render :edit
    end
  end
  
  private
  
  def fetch_task
    @task = @user.tasks.find(params[:id])
  end
  
  def fetch_user
    @user = params[:type].constantize.find(params["#{params[:type].tableize.singularize}_id"])
  end
  
  def task_params
    params.require(:task).permit(:category_id, :title, :description, :attachment)
  end
  
  def undone_tasks
    @undone_tasks = @user.tasks.undone
  end
end
