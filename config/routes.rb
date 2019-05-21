Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :items, only: [:index]
  resources :merchants, only: [:index]
  resources :users, only: [:new, :show, :edit]

  get '/login', to: 'sessions#new'
end
