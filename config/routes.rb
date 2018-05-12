Rails.application.routes.draw do

  root 'root#home'

  devise_for :admins
  devise_for :users


  resources :users

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :comments, only: [:create, :destroy]
    resources :favorites, only: [:create, :destroy]
  end

  resources :contacts, only: [:new, :create, :index, :show]
  resources :columns
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
