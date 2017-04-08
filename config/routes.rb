Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :articles
    resources :comments
    resources :users
    resources :authorities
    resources :tags
  end
end
