Rails.application.routes.draw do



  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

 resources :friendships do
  resources :users
end
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
