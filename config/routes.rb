Rails.application.routes.draw do
  post 'session/signin'
  delete 'session/signout'
  
  ActiveAdmin.routes(self)
  root 'welcome#index'
  resources :leagues
  resources :teams
  resources :users

end
