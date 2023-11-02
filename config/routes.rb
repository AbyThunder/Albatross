Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'register_user', to: 'users#register_user'
      post 'academy/create', to: 'academies#create'
      post 'tournament/create', to: 'tournaments#create'
      post 'league/create', to: 'leagues#create'
      post 'academy/update', to: 'leagues#update'
      resources :clubs, only: [:index]
      resources :academies, only: [:index] do
        resources :lessons, only: [:create]
        resources :sponsors, only: [:create]
      end
      resources :lessons do
        resources :trainers, only: [:index, :create]
      end
      resources :trainers
      resources :managers, only: [] do
        member do
          get 'assign_trainer'
          post 'save_trainer_assignment'
        end
      end
      resources :homeblocks, only: [:index]
      resources :tournaments, only: [:index]
      resources :leagues, only: [:index] do
        collection do
          get :names
        end
      end
    end
  end
end
