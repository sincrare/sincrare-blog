Rails.application.routes.draw do
  devise_for :users
  root to: 'article#index'

  namespace :admin do
    resources :articles
    resources :comments
    resources :authorities
    resources :tags
  end
end
