Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  get '/consumption', to: 'solar#consumption', as: 'consumption'
  get '/system', to: 'solar#system', as: "system"
  get '/summary', to: 'solar#show', as: 'summary'
end
