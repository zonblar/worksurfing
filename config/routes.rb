Rails.application.routes.draw do
  root to: 'pages#home'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  mount Attachinary::Engine => "/attachinary"
  get 'payments/new'

  resources :bookings do
    get 'reject'
    get 'validate'
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
  end

  authenticate :user do
    resources :workspaces do
      resources :bookings, only: [:index, :create] do
        resources :payments, only: [:new, :create]
      end
      resources :availabilities, only: [:new, :create]
      resources :reviews, only: [:new, :create]
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end

  resources :messages, only: [:new, :create]
  get 'users/:id/workspaces', to: 'workspaces#list', as: 'work'
  get 'users/:id/bookings', to: 'bookings#list', as: 'book'
end

