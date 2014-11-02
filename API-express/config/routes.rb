Rails.application.routes.draw do
  root 'users#index'
  post "/login" => 'sessions#login'
  get "/logout" => 'sessions#logout'

  resources :users do
    resources :packages do
      resources :requests
    end
  end
end
