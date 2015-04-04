Rails.application.routes.draw do
  post 'session/signin'
  delete 'session/signout'

  ActiveAdmin.routes(self)
  root 'welcome#index'

  post 'teams/subscribe'

  resources :leagues, only: [:index, :show] do
   resources :teams, only: [:show, :edit, :update] do
     resources :events
   end
  end
  resources :users, except: [:destroy]

end
