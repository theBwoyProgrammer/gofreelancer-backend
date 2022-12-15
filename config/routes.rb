Rails.application.routes.draw do
  default_url_options :host => 'localhost', :port => 3000
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :freelancers, only: %i[index show create destroy]
      resources :specializations, only: [:index, :create]
      # resources :users, only: [] do
      resources :reservations, only: [:create, :index, :new]
      # end
    end
  end
end
