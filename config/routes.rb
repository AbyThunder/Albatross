Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'home#index'
  resources :academies do
    resources :lessons, only: [:new, :create]
    resources :sponsors
    member do
      delete :destroy_academy
    end
  end
end
