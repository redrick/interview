class TasksController < AuthenticatedController

  before_action :get_task, only: [:edit, :update, :destroy, :toggle]

  def index
    @tasks = current_user.tasks.ordered
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js
      else
        format.js { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @task = current_user.tasks.new(task_params)
    respond_to do |format|
      if @task.save
        format.js
      else
        format.js { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:order].each do |key, value|
      # we don't need any callbacks here
      current_user.tasks.find(value[:id]).update_column(:sort_order, value[:position].to_i)
    end
    render :nothing => true
  end

  def toggle
    @task.toggle_done
    render :update
  end

  private

  def task_params
    params.require(:task).permit(:task)
  end

  def get_task
    @task = current_user.tasks.find(params[:id])
  end

end
