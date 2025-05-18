Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  root to: 'home#top'
  devise_for :users
  resources :skills, only: [:index, :show, :edit, :create, :destroy, :update] do
      resources :comments, only: :create do
        resources :likes, only: [:create, :destroy]
      end
    end
  resources :users, only: [:index, :show, :edit, :update]
  resources :groups, except: [:index] do
    resource :membership, only: [:create, :destroy]
  end
  get 'search', to: 'searches#search', as: 'search'
  get 'home/top'
  get 'home/about'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :comments, only: [:destroy] 
  end

  scope module: :public do
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
