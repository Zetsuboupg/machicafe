Rails.application.routes.draw do
  # Publicユーザー用ルーティング
  scope module: :public do
    devise_for :users
    root to: 'homes#about'
    get 'about', to: 'homes#about'
    get 'top', to: 'homes#top'

    resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :cafes do
      resources :reviews, only: [:index, :new, :create, :show] do
        resources :comments, only: [:create]
      end
    end
    resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :likes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

  # Adminユーザー用ルーティング
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:index, :destroy]
    # resources :cafes do # 全部(CRUD)
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
