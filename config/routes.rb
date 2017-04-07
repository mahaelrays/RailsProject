Rails.application.routes.draw do


  resources :order_details
  resources :orders
  get 'home/index'

  get 'notifications/index'
  resources :mygroups do
      member do
        post :new_member
        delete :delete_member

      end
   end

  # resources :mygroups
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

 resources :friendships

  # resources :users

  resources :users do
    post :addfriend
     member do
       get :follow
       get :unfollow
      # post '/newfollow', to: 'users#newfollow'
     end
  end

  root 'users#index'
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
