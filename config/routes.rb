Rails.application.routes.draw do
  resources :users do
    resources :palettes, only: [:index]
  end
  resources :palettes do
    resources :colors, only: [:create, :update, :destroy]
  end
  get "signin", to: "users#sign_in"
  post "signin", to: "users#set_sign_in"
  delete "signin", to: "users#sign_out"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "palettes#index"
end
