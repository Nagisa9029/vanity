Rails.application.routes.draw do

  root 'root#home'

  devise_for :admins, :controllers => {
    :registrations => 'admins/registrations',
    :sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  get '/terms_of_use' => 'root#terms_of_use', as: 'terms_of_use_root'
  get '/privacy' => 'root#privacy', as: 'privacy_root'
  get '/about' => 'root#about', as: 'about_root'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  get '/posts/postrule' => 'posts#postrule'
  get '/posts/follower' => 'posts#follower'
  get '/posts/mycommit' => 'posts#mycommit'
  resources :posts do
    resource :comments, only: [:create, :update,  :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  get '/gourmets/gourmetrule' => 'gourmetrule'
  get '/gourmets/follower' => 'follower'
  get '/gourmets/mycommit' => 'mycommit'
  resources :gourmets do
    resource :gourmetcomments, only: [:create, :update, :destroy]
    resource :gourmetfavorites, only: [:create, :destroy]
    resource :populars, only: [:destroy]
    member do
      post "add", to: "populars#create"
    end
  end
  resources :populars, only: [:destroy, :index]


  resources :columns do
    resource :loves, only: [:create]
  end

  resources :lists do
    resource :listlovers, only: [:create, :destroy]
  end

  resources :studys, only: [:new, :index]
  get '/studys/bronze' => 'bronze'
  get '/studys/silver' => 'silver'
  get '/studys/gold' => 'gold'
  get '/studys/platinum' => 'platinum'

  resources :contacts, only: [:create, :update, :index, :show]

  get '/books/sepage' => 'books#sepage'
  resources :commons
  resources :books

  namespace :admins do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show, :destroy] do
      resource :comments, only: [:destroy]
    end
    resources :gourmets, only: [:index, :show, :destroy] do
      resource :gourmetcomments, only: [:destroy]
    end
    resources :columns, only: [:index, :show, :destroy]
    resources :contacts, only: [:update, :index, :show]
    resources :commons, only: [:index, :show, :destroy]
    resources :books
    get '/books/sepage' => 'books#sepage'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
