Interview::Application.routes.draw do
  # only user can register
  devise_for :users
  #
  devise_for :admins, skip: [:registrations]
  devise_for :managers, skip: [:sessions, :registrations]

  resources :tasks, except: [:show] do
    patch :toggle, on: :member
    put :sort, on: :collection
  end
  resources :categories, except: [:show]

  namespace :admin do
    resources :users
  end

  root 'dashboard#index'

end
