Rails.application.routes.draw do
  devise_for :users, controllers: {
      registrations: 'users/registrations'
  }
  root to: 'articles#index'

  resources :articles, :only => [:index, :show] do
    collection do
      get 'page/:page_id', to: 'articles#page'
      get 'daily/:year/:month/:day', to: 'articles#daily'
      get 'daily/:year/:month/:day/page/:page_id', to: 'articles#daily'
      get 'monthly/:year/:month', to: 'articles#monthly'
      get 'monthly/:year/:month/page/:page_id', to: 'articles#monthly'
      get 'search_by/:keyword', to: 'articles#search_by'
      get 'search_by/:keyword/page/:page_id', to: 'articles#search_by'
      get 'tag/:tag_id', to: 'articles#tag'
      get 'tag/:tag_id/page/:page_id', to: 'articles#tag'
    end
    member do
      post 'entry_comment'
    end
  end
  namespace :admin do
    resources :articles
    resources :comments
    resources :authorities
    resources :tags
  end
end
