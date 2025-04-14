Rails.application.routes.draw do
  resources :kittens

  get "up" => "rails/health#show", as: :rails_health_check
end
