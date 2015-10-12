$('.tasks #<%= dom_id @task %>').replaceWith('<%= j ui_component "tasks/task", task: @task, user: @user %>');
