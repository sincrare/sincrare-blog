Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, :only => [:index, :show]
  namespace :admin do
    resources :articles
    resources :comments
    resources :authorities
    resources :tags
  end
end
