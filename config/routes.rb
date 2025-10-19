Rails.application.routes.draw do
  devise_for :users

  # ログイン済みはダッシュボード、未ログインはサインイン
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "devise/sessions#new"
  end

  # ダッシュボード
  get "dashboard", to: "dashboard#index"

  # 記録（標準REST）
  resources :training_sessions do
    collection do
      # /training_sessions/sessions_on_date?date=YYYY-MM-DD
      get :sessions_on_date
    end
    # 必要に応じてネスト
    resources :session_exercises, only: %i[create update destroy]
  end

  # プロフィール（必要なら）
  resources :users, only: :show

  # 目標
  resources :goals
end
