Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new'
  # get 'users/:id/edit', to: 'users#edit'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  resources :users, only: [:edit, :new, :index, :show, :create, :update, :destroy] do
    resources :artwork_shares, only: [:index]
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:index, :show, :create, :update, :destroy] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy, :index] do
    resources :likes, only: [:index]
  end
  resources :likes, only: [:index]
end

