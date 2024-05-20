Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :users, only: :show
  resources :goals
  resources :session_exercises
  resources :training_sessions do
    collection do
      get 'sessions_on_date/:date', to: 'training_sessions#sessions_on_date', as: 'sessions_on_date'
      get '/patients/:id', to: 'patients#show'
    end
    member do
      post 'edit', to: 'training_sessions#update' # POSTリクエストをupdateアクションにルーティング
    end
  end
end
