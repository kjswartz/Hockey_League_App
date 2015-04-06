Rails.application.routes.draw do

  post 'session/signin'
  delete 'session/signout'

  ActiveAdmin.routes(self)
  root 'welcome#index'

  post 'teams/subscribe'

  resources :leagues, only: [:index, :show] do
   resources :games;
   resources :teams, only: [:show, :edit, :update] do
     resources :events
      member do
        post 'will_attend'
        delete 'not_attend'
      end
   end
  end
  resources :users, except: [:destroy]

end
