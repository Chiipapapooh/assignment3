Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  resources :books, only: [:new, :index, :show, :create]
  resources :users, only: [:show, :edit]
  devise_for :users
  root to: "homes#top"
  get '/homes/about' => "homes#about", as: "about"
end
