
Interview::Application.routes.draw do

  devise_for :users
  resources :users, except: :show do
    resources :tasks, except: :show do
      member do
        patch :toggle
        get :download_attachment
        patch :destroy_attachment
      end
      collection do
        patch :sort
      end
    end
    get 'tasks/active',     controller: :tasks, action: :index, scope: :active
    get 'tasks/completed',  controller: :tasks, action: :index, scope: :completed
  end

  root 'users#index'

end
