class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :toggle, :reorder, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # PATCH/PUT /tasks/1/toggle
  def toggle
    respond_to do |format|
      @task.toggle!(:done)
      format.html { render @task }
    end
  end

  # PATCH/PUT /tasks/1/reorder
  def reorder
    respond_to do |format|
      @task.order_position = params[:order_position]
      @task.save
      format.html { head :no_content }
    end
  end


  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :category_id)
    end
end
