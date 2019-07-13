Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  root "pages#index"
  get "pages/help"
  
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :users  
  resources :topics

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  

  get '/comments/:topic_id/new', to: 'comments#new', as: 'comments'
  post '/comments/:topic_id/create', to: 'comments#create', as:'comments_create'

  # get 'comments/new'
  # post '/comments/create', to: 'comments#create'
  resources :comments
end
