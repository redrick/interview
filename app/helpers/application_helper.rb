module ApplicationHelper
  def count_tasks
    Task.where("user_id=#{current_user.id} AND status='pending'").count
  end
end
