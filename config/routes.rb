Interview::Application.routes.draw do

  resources :tasks

  resources :managers, controller: :users, type: 'Manager'
  resources :admins, controller: :users, type: 'Admin'

end
