Interview::Application.routes.draw do
  devise_for :users
  
  root to: "todos#index"
  
  match 'tasks/:id/toggle', to: 'tasks#toggle', via: :post
end
