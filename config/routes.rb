Rails.application.routes.draw do
  root 'welcome#index'
  match '/user', to: 'welcome#user', via: 'get'

  resources :users
  resources :sessions
end
