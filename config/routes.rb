Interview::Application.routes.draw do
  devise_for :users
  devise_for :admins
  devise_for :managers

  resources :tasks, except: [:show]

  root 'dashboard#index'

end
