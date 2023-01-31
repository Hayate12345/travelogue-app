Rails.application.routes.draw do
  devise_for :users
  get "/post", to: "posts#index"
  get "/post/new", to: "posts#new"
  post "/post/create", to: "posts#create"
end
