
class TasksController < ApplicationController

  def index
    @tasks = Task.ordered_by_position_asc
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:success] = "Task successfully created."
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)

      if params[:remove_attachment] == '1'
        @task.remove_attachment!
        @task.save!
      end

      flash[:success] = "Task successfully updated."
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      flash[:success] = "Task successfully deleted."
    else
      flash[:danger] = "Error occurred, task has not been deleted."
    end

    redirect_to tasks_path
  end


  def switch
    task = Task.find(params[:id])
    task.update(completed: !task.completed)
    @tasks = Task.ordered_by_position_asc
  end


  def move
    task = Task.find(params[:id])
    task.move_to! params[:position]
    @tasks = Task.ordered_by_position_asc
  end


  private

  def task_params
    params.require(:task).permit(
        :name,
        :description,
        :completed,
        :position,
        :attachment,
        :category_id
    )
  end
end
