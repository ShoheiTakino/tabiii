Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources  :posts do
    resources :comments, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
end
