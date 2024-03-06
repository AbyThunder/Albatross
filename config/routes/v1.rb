# frozen_string_literal: true

module Routes
  module V1
    # Defines routes for V1 and newer API
    def self.extended(router)
      router.instance_exec do
        namespace :v1, path: '' do
          resources :users, only: :show

          post 'register_user', to: 'users#register_user'
          post 'academy/create', to: 'academies#create'
          post 'tournament/create', to: 'tournaments#create'
          post 'lesson/create', to: 'lessons#create'
          post 'league/create', to: 'leagues#create'
          patch 'academy/update', to: 'academies#update'
          resources :clubs, only: [:index]
          resources :academies, only: [:index, :show, :create, :update] do
            resources :lessons, only: [:create, :update]
            resources :academy_sponsors, only: [:create, :update]
          end
          resources :lessons, only: [:index, :show, :create, :update]
          resources :tournaments, only: [:index, :show, :update]
          resources :leagues, only: [:index, :show] do
            collection do
              get :names
            end
          end
        end
      end
    end
  end
end
