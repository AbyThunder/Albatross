Rails.application.routes.draw do
  # devise_for :users
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'register_user', to: 'users#register_user'
      post 'academy/create', to: 'academies#create'
      post 'tournament/create', to: 'tournaments#create'
      post 'lesson/create', to: 'lessons#create'
      post 'league/create', to: 'leagues#create'
      post 'academy/update', to: 'leagues#update'
      resources :clubs, only: [:index]
      resources :academies, only: [:index, :show] do
        resources :lessons, only: [:create]
        resources :sponsors, only: [:create]
      end
      resources :lessons, only: [:index, :show] do
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
      resources :tournaments, only: [:index, :show, :update]
      resources :leagues, only: [:index, :show] do
        collection do
          get :names
        end
      end
    end
  end
end
