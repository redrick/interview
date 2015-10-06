Interview::Application.routes.draw do

  resources :users, except: :show do
    resources :tasks, except: :show do
      member do
        patch :toggle
        get :download_attachment
        patch :destroy_attachment
      end
    end
  end

  root 'users#index'

end
