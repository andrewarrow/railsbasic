Rails.application.routes.draw do
  root 'welcome#index'
  root 'welcome#user'

  resources :users
  resources :sessions
end
