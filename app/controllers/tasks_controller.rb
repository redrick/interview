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

  private

  def task_params
    params.require(:task).permit(:task)
  end

  def get_task
    @task = current_user.tasks.find(params[:id])
  end

end
