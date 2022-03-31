Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'posts/new', to: 'posts#new'

  resources :users, only: [:index, :show] do
    resources 'posts', on: :show, only: [:index, :show]
  end
  # Defines the root path route ("/")

  root 'users#index'
end
