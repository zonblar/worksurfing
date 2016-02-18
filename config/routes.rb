Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :bookings
    resources :users, only: [:show, :edit, :update] do

    end
  authenticate :user do
    resources :workspaces do
      resources :bookings, only: [:index, :create]
      resources :availabilities, only: [:new, :create]
      resources :reviews, only: [:new, :create]
    end
  end
  mount Attachinary::Engine => "/attachinary"

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

