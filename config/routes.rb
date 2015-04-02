Rails.application.routes.draw do
  post 'session/signin'
  delete 'session/signout'

  ActiveAdmin.routes(self)
  root 'welcome#index'

  resources :leagues, only: [:index, :show]
  resources :teams, only: [:show, :edit, :update]
  resources :users, except: [:destroy]

end
