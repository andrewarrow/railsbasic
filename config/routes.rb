Rails.application.routes.draw do
  root 'welcome#index'
  match 'user', to: 'welcome#user', via: 'get'

  resources :users
  resources :companies
  resources :sessions

  namespace :rba do
    resources :users
  end

  match 'blog', to: 'blog#index', via: 'get'
  match 'blog/:year/:month/:slug', to: 'blog#show', via: 'get'
end
