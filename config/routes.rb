Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy]
  get 'homes/about' => 'homes#about',as: 'about'
  resources :users, only: [:show, :index, :edit, :update]
end
