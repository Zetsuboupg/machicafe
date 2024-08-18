Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


scope module: :public do
  devise_for :users
  root to: 'homes#about'
  get 'about', to: 'homes#about'
  get 'top', to: 'homes#top'

  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :cafes do
    resources :reviews do
      resources :comments, only: [:create]
    end
  end
  resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :likes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end


  # SystemAdminのルーティング
namespace :system_admin do
    resources :users, only: [:index, :edit, :update, :destroy]
    # カフェ管理機能のルーティングもここに追加可能
  end
resources :system_admin, only: [:index, :edit, :update, :destroy]


##admin
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
  end
  resources :users, only: [:destroy]
end


