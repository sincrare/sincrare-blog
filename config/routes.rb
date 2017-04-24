Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root to: 'articles#index'

  resources :articles, :only => [:index, :show] do
    collection do
      get 'page/:id', to: 'articles#page'
      get 'daily/:year/:month/:day', to: 'articles#daily'
      get 'monthly/:year/:month', to: 'articles#monthly'
      get 'search_by/:keyword', to: 'articles#search_by'
      get 'category_by/:category_id', to: 'articles#category_by'
    end
  end
  namespace :admin do
    resources :articles
    resources :comments
    resources :authorities
    resources :tags
  end
end
