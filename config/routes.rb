Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  resources :academies do
    resources :lessons, only: [:new, :create, :show]
    resources :sponsors
    post 'request_to_join', to: 'academy_requests#create', on: :member
    member do
      delete :destroy_academy
    end
  end

  resources :managers do
    member do
      get :assign_trainer
      post :save_trainer_assignment
    end
  end
end
