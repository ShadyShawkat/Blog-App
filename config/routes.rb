Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    resources 'posts', on: :show, only: [:index]
  end
  # Defines the root path route ("/")

  get '/', to: redirect('/users')
end
