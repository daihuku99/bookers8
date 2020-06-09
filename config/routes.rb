Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'homes#top'

  get 'homes/about' => 'homes#about', as: 'about'

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }

  resources :book_images, only: [:create, :index, :edit, :update, :destroy, :show] do
  	resource :book_comments, only: [:create]
  	resource :favorites, only: [:create, :destroy]
    get :search, on: :collection
  end

  resources :users, only: [:index, :show, :edit, :update] do
    get :search, on: :collection
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
