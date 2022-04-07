Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'posts/new', to: 'posts#new'
  # post 'posts', to: 'posts#create'
  # post 'comments/:post_id', to: 'comments#create'
  # post 'likes/:post_id', to: 'likes#create'
  resources :users, only: [:index, :show, :create] do
    resources :posts, on: :show, only: [:index, :show, :destroy, :create] do
      resources :comments, on: :show, only: [:index, :create, :destroy]
    end
  end
  # Defines the root path route ("/")

  root 'users#index'
end
