Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  get "/books/top" => "books#top", as: "books"
  get "/users/index" => "users#index", as: "users"

  resources :postimages, only: [:new, :index, :show]
  
end