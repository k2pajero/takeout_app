Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root 'items#index'
  resource :basket, only: :show
  resource :charge, only: :create
  resources :users, only: [:create, :new]
  resources :items do
    scope module: :items do
      resources :add_to_baskets, only: [:create]
      resources :delete_in_baskets, only: [:create]
    end
  end

  # resources :address
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

end
