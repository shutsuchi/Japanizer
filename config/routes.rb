Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root to: 'homes#top', as: 'top'
    get 'about', to: 'homes#about', as: 'about'
    get 'searches', to: 'searches#search', as: 'search'

    resources :users, only: %i[ show edit update ]
    get 'withdraw', to: 'users#withdraw', as: 'withdraw'
    patch 'switch', to: 'users#switch', as: 'switch'
    resources :posts, only: %i[ index show edit create update destroy ] do
      resource :likes, only: %i[ index create destroy ]
      resource :post_comments, only: %i[ create update destroy ]
      collection do
        get :cities_select
      end
    end
    resources :albums, only: %i[ index show edit create update destroy ] do
      resource :bookmarks, only: %i[ index create destroy ]
    end

    resources :prefectures, only: %i[ index ]
    resources :genres, only: %i[ index create update destroy ]
    get 'budget', to: 'genres#budget', as: 'budget'
    get 'age', to: 'genres#age', as: 'age'
    get 'nation', to: 'genres#nation', as: 'nation'
    #resources :events, only:  %i[ edit create update destroy ]
    resources :events
  end
end
