Rails.application.routes.draw do
  resources :events
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  root to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'searches', to: 'searchees#search', as: 'search'

  resources :users, only: %i[ show edit update]
  resources :posts, only: %i[ index show edit create update destroy ] do
    resource :post_comments, only: %i[ create update destroy ]
    collection do
      get :cities_select
    end
  end
  resources :genres, only: %i[ index create update destroy ]
  resources :albums, only: %i[ index show edit create update destroy ]
  resources :events, only:  %i[ edit create update destroy ]
  resources :bookmarks, only: %i[ index create destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
