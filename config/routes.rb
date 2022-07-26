Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "/dashboard", to: "dashboards#index"

  resources :castles, only: %i[index new show create edit update] do
    resources :favorites, only: %i[index create update destroy]
    resources :bookings, only: :create do
      resources :payments, only: :new
    end
  end

  resources :castles, only: :destroy
  resources :bookings, only: %i[show destroy]

  get "/castles/user/:id", to: "castles#index_by_user", as: "user_index"
  get "/castles/:id/fullscreen", to: "castles#full_screen", as: "full_screen"

  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
