Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :battery_wizard do
    get '/installation/new', to: 'battery_wizard/installation#new', as: 'new_installation'
    get '/summary', to: 'battery_wizard/installation#show', as: 'summary'
    get '/consumption', to: 'battery_wizard/consumption#new', as: 'consumption'
    get '/system', to: 'battery_wizard/system#new', as: "system"

  end
end
