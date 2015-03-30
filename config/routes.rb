Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root 'welcome#index'
  resources :leagues
  resources :teams
  resources :players

end
