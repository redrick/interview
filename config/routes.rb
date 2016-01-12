Interview::Application.routes.draw do
  devise_for :users
  devise_for :admins
  devise_for :managers

  resources :tasks, except: [:show] do
    patch :toggle, on: :member
    put :sort, on: :collection
  end

  root 'dashboard#index'

end
