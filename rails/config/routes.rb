Rails.application.routes.draw do
  resources :days, only: %i[index show]
  resources :exercise_entries, only: %i[new create]
  resources :food_entries, only: %i[new create]
  resources :medication_entries, only: %i[new create]
  resources :water_entries, only: %i[new create]

  root "days#index"
end
