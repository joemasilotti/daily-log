Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :days, only: %i[index show]
  resources :exercise_entries, only: %i[new create]
  resources :food_entries, only: %i[new create]
  resources :medication_entries, only: %i[new create]
  resources :water_entries, only: %i[new create]

  resources :configurations, only: [] do
    get :ios, on: :collection
  end

  root "days#index"
end
