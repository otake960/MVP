Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :goals
  resources :session_exercises
  resources :training_sessions do
    collection do
      get 'sessions_on_date'
    end
  end
end