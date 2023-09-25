Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :destroy, :update]
  resources :users, only: [:show, :edit, :index, :update]
  root to: "home#top"
  get '/home/about' => "home#about", as: "about"
end
