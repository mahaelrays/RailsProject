Rails.application.routes.draw do
  resources :order_details
  resources :group_members
  resources :friends
  resources :orders
  resources :groups
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
