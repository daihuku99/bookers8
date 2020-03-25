Rails.application.routes.draw do
  root to: 'homes#top'

  get 'homes/about' => 'homes#about', as: 'about'

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }

  resources :book_images, only: [:create, :index, :edit, :update, :destroy, :show] do
  	resource :book_comments, only: [:create]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    get :search, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
