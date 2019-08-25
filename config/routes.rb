Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "activities#index"

  resources :activities, only: %i(index)
  resources :users_activities, only: %i(create)
end
