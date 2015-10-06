Interview::Application.routes.draw do

  resources :users do
    resources :tasks do
      patch :toggle, on: :member
    end
  end

  root 'users#index'

end
