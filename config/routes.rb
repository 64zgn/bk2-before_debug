Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users,only: [:show,:index,:edit,:update]
  root "homes#top"
  get "users" => "users#index"
  get "home/about" => "homes#about"
  delete '/books' => 'books#destroy'
end