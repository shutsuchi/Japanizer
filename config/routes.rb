Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'genres/index'
  get 'bookmarks/index'
  get 'likes/index'
  get 'albums/index'
  get 'albums/edit'
  get 'posts/show'
  get 'posts/edit'
  get 'searches/search'
  get 'plans/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/withdraw'
  get 'homes/about'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
