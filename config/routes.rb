Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
devise_for :users
root to: 'homes#about'
get 'about', to: 'homes#about'


resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :cafes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :categories, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :reviwes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :likes, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :comments, only: [:new, :create, :index, :show, :edit, :update, :destroy]
resources :administrators, only: [:new, :create, :index, :show, :edit, :update, :destroy]

end
