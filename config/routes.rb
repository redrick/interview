Interview::Application.routes.draw do
  devise_for :users
  devise_for :admins
  devise_for :managers

  root 'dashboard#index'

end
