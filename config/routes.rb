Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
  post 'weather', to: 'home#weather', as: 'weather'
  get 'weather', to: 'home#weather'
end
