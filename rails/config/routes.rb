Rails.application.routes.draw do
  get '/settings', to: 'settings#edit', as: :settings

  resource :home, only: :show
  resource :session, only: %i[new create destroy]
  resource :settings, only: %i[edit update]

  resources :days, only: %i[index show]
  resources :exercise_entries, only: %i[new create edit update]
  resources :food_entries, only: %i[new create edit update]
  resources :medication_entries, only: %i[new create edit update]
  resources :caffeine_entries, only: %i[new create edit update]
  resources :alcohol_entries, only: %i[new create edit update]
  resources :users, only: %w[new create destroy]
  resources :water_entries, only: %i[new create]

  resources :configurations, only: [] do
    get :ios, on: :collection
  end

  root 'home#show'
end
