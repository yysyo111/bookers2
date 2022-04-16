Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/index'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/show'
  # get 'books/index'
  # get 'books/edit'
  devise_for :users
  root to: "homes#top"
  get "homes/about", as: "about"
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
