Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'searches', to: 'searchees#search', as: 'search'

  resources :users, only: %i[ show edit update]
  resources :posts, only: %i[ new show edit create update destroy ] do
    resource :post_comments, only: %i[ create update destroy ]
  end
  resources :genres, only: %i[ index create update destroy ]
  resources :albums, only: %i[ new index edit create update destroy ]
  resources :plans, only:  %i[ edit create update destroy ]
  resources :bookmarks, only: %i[ index create destroy ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
