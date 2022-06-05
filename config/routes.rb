Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources  :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :follows, :followers
    end
    resource :follows, only: [:create, :destroy]
  end
end
