Interview::Application.routes.draw do

  resources :users do
    resources :tasks do
      member do
        patch :toggle
        get :download_attachment
        patch :destroy_attachment
      end
    end
  end

  root 'users#index'

end
