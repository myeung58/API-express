Rails.application.routes.draw do
  root 'users#index'
  post "/login" => 'sessions#login'
  get "/logout" => 'sessions#logout'

  resources :users do
    get '/new_yo' => 'packages#yo'
    get '/new_twitter' => 'packages#twitter'
    resources :packages do
      resources :requests
    end
  end
end
