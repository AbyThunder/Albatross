Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      post 'register_user', to: 'users#register_user' 
      resources :clubs, only: [:index]
      resources :academies do
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
    end
  end
end
