Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :freelancers, only: [:index, :show, :create]
      resources :specializations, only: [:index, :create]
      resources :users, only: [] do
        resources :reservations, only: [:create, :index, :new]
      end
    end
  end
end
