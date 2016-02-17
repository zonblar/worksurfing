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
    end
  end
  mount Attachinary::Engine => "/attachinary"

  resources :messages, only: [:new, :create]


  resources :conversations, only: [:index, :show, :destroy] do
  member do
    post :reply
  end
end
    get 'users/:id/workspaces', to: 'workspaces#list', as: 'work'
end

