Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resource :session
  resource :registration
  resources :passwords, param: :token
  resources :posts
  root "posts#index"
end
