Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
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
