Interview::Application.routes.draw do

  devise_for :users

  root to: "tasks#index"

  resources :categories, except: :show

  resources :tasks, except: :show do
    member do
      patch :toggle
      patch :reorder
      get :download_attachment
    end
  end

  resources :managers, except: :show, controller: :users, type: 'Manager'
  resources :admins, except: :show, controller: :users, type: 'Admin'

end
