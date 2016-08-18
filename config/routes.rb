Rails.application.routes.draw do

  namespace :admin do
    resources :users
  end
  get 'admin/users_controller'

  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :users, only: [:new, :create] #blacklist doesn't create helpers to not metioned
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'
  namespace :admin do
    resources :users
    #put "impersonate"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
