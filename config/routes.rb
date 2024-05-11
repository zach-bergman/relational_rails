Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  #home
  get "/", to: "home#index"

  #stores
  get "/stores", to: "stores#index"
  get "/stores/new", to: "stores#new"
  post "/stores", to: "stores#create"
  get "/stores/:id", to: "stores#show"
  get "/stores/:id/edit", to: "stores#edit"
  patch "/stores/:id", to: "stores#update"

  #guitars
  get "/guitars", to: "guitars#index"
  get "/guitars/:id", to: "guitars#show"
  get "guitars/:id/edit", to: "guitars#edit"
  patch "guitars/:id", to: "guitars#update"

  #store-guitars
  get "/stores/:store_id/guitars", to: "store_guitars#index"
  get "/stores/:store_id/guitars/new", to: "store_guitars#new"
  post "/stores/:store_id/guitars", to: "store_guitars#create"
end
