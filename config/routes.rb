Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :battery_wizard do
    resources :installation, only: [:show, :new, :create]
    resources :consumption, only: [:new]
    resources :system, only: [:new]
  end
  resources :battery, only: [:new, :create]
end
