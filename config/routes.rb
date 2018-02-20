Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/installation/new', to: 'battery_wizard#new', as: 'new_installation'
  get '/consumption', to: 'battery_wizard#consumption', as: 'consumption'
  get '/system', to: 'battery_wizard#system', as: "system"
  get '/summary', to: 'battery_wizard#show', as: 'summary'
end
