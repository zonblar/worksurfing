Rails.application.routes.draw do
 devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :bookings
    resources :users, only: [:show, :edit, :update]
    authenticate :user do
      resources :workspaces, only: [:new, :create, :edit, :update, :show] do
      resources :bookings, only: [:index, :create]
    end
  end
  mount Attachinary::Engine => "/attachinary"
end


