Rails.application.routes.draw do
  resources :other_models
  resources :primary_models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
