Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:create, :show, :index, :edit, :update, :destroy]
  get 'homes/about' => 'homes#about',as: 'about'
  resources :users, only: [:show, :index, :edit, :update]
end
