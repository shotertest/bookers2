Rails.application.routes.draw do
  
  resources :postimages, only: [:new, :index, :show]
  
  devise_for :users
  root to: 'homes#top'
  
end