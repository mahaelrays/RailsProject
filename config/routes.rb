Rails.application.routes.draw do
  get 'notifications/index'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :order_details
  resources :group_members
  resources :friends
  resources :orders
  resources :groups
  resources :users

  root 'users#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
