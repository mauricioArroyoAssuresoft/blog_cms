Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resource :session
  resource :registration
  resources :passwords, param: :token
  resources(:posts) do
    resources(:comments, only: :create)
  end

  root "posts#index"
end
