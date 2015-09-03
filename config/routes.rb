Interview::Application.routes.draw do

  root to: "tasks#index"

  resources :categories, except: :show

  resources :tasks, except: :show do
    member do
      patch :toggle
      patch :reorder
    end
  end

  resources :managers, controller: :users, type: 'Manager'
  resources :admins, controller: :users, type: 'Admin'

end
