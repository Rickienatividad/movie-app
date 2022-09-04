Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #actors

  get "/actors/:id" => "actors#show"

  #movies

  get "/movies" => "movies#index"
  get "/movies/:id" => "movies#show"
end
