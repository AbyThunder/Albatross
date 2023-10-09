Rails.application.routes.draw do
  # get 'home/index'
  # devise_for :users
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Defines the root path route ("/")
  # root to: 'home#index'
  # resources :academies do
  #   resources :lessons, only: [:new, :create, :show]
  #   resources :sponsors
  #   post 'request_to_join', to: 'academy_requests#create', on: :member
  #   member do
  #     delete :destroy_academy
  #   end
  # end

  # resources :managers do
  #   member do
  #     get :assign_trainer
  #     post :save_trainer_assignment
  #   end
  # end
  namespace :api do
    namespace :v1 do
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
    end
  end
end
