class TasksController < AuthenticatedController

  before_action :get_task, only: [:edit, :update, :destroy]

  def index
    @tasks = current_user.tasks.ordered
  end

  def new
    @task = Task.new
    respond_with @task
  end

  def edit
    respond_with @task
  end

  def update
    @task = @task.update(task_params)
    respond_with @task, location: tasks_path
  end

  def create
    @task = current_user.tasks.create(task_params)
    respond_with @task, location: tasks_path
  end

  def destroy
    @task.destroy
    respond_with @task, location: tasks_path
  end

  def sort
    params[:order].each do |key, value|
      # we don't need any callbacks here
      current_user.tasks.find(value[:id]).update_column(:sort_order, value[:position].to_i)
    end
    render :nothing => true
  end

  private

  def task_params
    params.require(:task).permit(:task)
  end

  def get_task
    @task = current_user.tasks.find(params[:id])
  end

end
