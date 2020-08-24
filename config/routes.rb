Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  get "users" => "users#index"
  get "home/about" => "homes#about"
  delete '/books' => 'books#destroy'

  resources :books do
	  resource :favorites, only: [:create,:destroy]
	  resource :book_comments, only: [:create,:destroy]
  end

  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only:[:index,:show, :update, :edit] do
     member do
     get :followings, :followers
    end
  end

end