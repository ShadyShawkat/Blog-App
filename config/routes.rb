Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'posts/new', to: 'posts#new'
  post 'posts', to: 'posts#create'
  post 'comments/:post_id', to: 'comments#create'
  post 'likes/:post_id', to: 'likes#create'

  
  resources :users, only: [:index, :show] do
    resources 'posts', on: :show, only: [:index, :show, :destroy]
  end
  # Defines the root path route ("/")

  root 'users#index'
end
