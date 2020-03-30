Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    root to: 'homes#top', as: 'top'
    get 'homes/about', to: 'homes#about', as: 'about'
    get 'searches', to: 'searches#search', as: 'search'

    resources :users, only: %i[ show edit update]
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
    resources :events, only:  %i[ edit create update destroy ]
  end
end
