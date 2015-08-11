class TasksController < ApplicationController
  before_action :fetch_user
  before_action :fetch_task, only: [:destroy, :done, :edit, :show, :update]
  
  def create
    @task = Task.new(task_params)
    @task.user = @user
    if @task.save
      redirect_to [@user, @task]
    else
      render :new
    end
  end
  
  def destroy
    begin
      @task.destroy
      redirect_to [@user, :tasks]
    rescue Exception => e
      redirect_to [@user, @task]
    end
  end
  
  def done
    @task.update_column(:done, true)
    redirect_to :back
  end
  
  def index
    @tasks = @user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def update
    if @task.update_attributes(task_params)
      redirect_to [@user, @task]
    else
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
    params.require(:task).permit(:title, :description, :attachment)
  end
end
