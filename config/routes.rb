Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
  root to: "homes#top"
  get '/homes/about' => "homes#about", as: "about"
end
