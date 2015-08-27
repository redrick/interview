class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]
  respond_to :html

  def index
    @tasks = Task.my_tasks current_user.to_param
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with @task do |format|
      format.html
      format.js {  render json: @task }
    end
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task)
        .permit(:name, :description, 
                :position, :category_id,
                :status, :user_id,
                :position,
                assets_attributes: [:attachment])
    end

    def set_categories
      @categories = Category.all
    end
end
