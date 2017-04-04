Rails.application.routes.draw do



  resources :mygroups
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

 resources :friendships
  resources :users

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
