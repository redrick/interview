Interview::Application.routes.draw do

  resources :users
  scope :users do
    resources :admins,    controller: 'users', type: 'Admin'
    resources :managers,  controller: 'users', type: 'Manager'
  end

  root 'users#index'

end
