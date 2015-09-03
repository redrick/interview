Interview::Application.routes.draw do

  resources :categories

  resources :tasks do
    patch :toggle, on: :member
    patch :reorder, on: :member
  end

  resources :managers, controller: :users, type: 'Manager'
  resources :admins, controller: :users, type: 'Admin'

end
