Rails.application.routes.draw do
  # health check
  get "up" => "rails/health#show", as: :rails_health_check

  # authentication and user account routes
  resource :session
  resource :registration
  resources :passwords, param: :token

  # public domain / core application resources
  resources(:posts) do
    resources(:comments, only: :create)
  end

  # admin / namespace areas
  namespace(:admin) do
    root("dashboard#index")
    resources(:comments, only: :index)
  end

  # root route place near or at bottom
  root "posts#index"
end
