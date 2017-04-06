Rails.application.routes.draw do

  get 'home/index'

  resources :items
  resources :orders
  get 'notifications/index'


  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

 resources :friendships
  resources :users

  root 'users#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
