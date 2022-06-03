Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources  :posts do
    resources :chats 
  end
  resources :users, only: [:show, :edit, :update, :destroy]
end
