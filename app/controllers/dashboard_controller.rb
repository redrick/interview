class DashboardController < AuthenticatedController
  def index
    @unfinished_tasks = current_user.tasks.unfinished
  end
end
