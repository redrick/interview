$('.tasks #<%= dom_id @task %>').replaceWith('<%= j render "components/tasks/task", task: @task, user: @user %>');
