Rails.application.routes.draw do
  # Publicユーザー用ルーティング
  scope module: :public do
    devise_for :users, controllers: {
      registrations: 'public/registrations'
    }
    root to: 'homes#about'
    get 'about', to: 'homes#about'
    get 'top', to: 'homes#top'

    resources :users
    resources :cafes, only: [:index, :show] do
      resources :reviews, only: [:index, :new, :create, :show] do
        resources :comments, only: [:create]
      end
    end
    resources :categories
    resources :likes
  end

  # Adminユーザー用ルーティング
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :show, :destroy]
    resources :cafes
    resources :reviews, only: [:destroy]
    #   resources :reviews, only: [:show, :destroy] do
    #     resources :comments, only: [:destroy]
    #   end
    # end
  end

  # SystemAdminのルーティング（必要ならアンコメント）
  # namespace :system_admin do
  #   resources :users, only: [:index, :edit, :update, :destroy]
  # #   # カフェ管理機能のルーティングもここに追加可能
  # end
end
