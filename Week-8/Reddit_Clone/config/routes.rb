Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show, :index] do
    # resources :subs, only: [:create, :index, :show]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy] do
    resources :posts, only: [:new, :create, :edit, :update]
  end
  resources :posts, only: [:destroy, :show]
end
