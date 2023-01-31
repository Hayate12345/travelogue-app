Rails.application.routes.draw do
  devise_for :users
  get "/post", to: "posts#index"
  get "/post/new", to: "posts#new"
  post "/post/create", to: "posts#create"

  get "/profile", to: "profiles#index"
  get "/profile/show/:id", to: "profiles#show"
  post "/profile/follow/:user_id", to: "profiles#follow"
  delete "/profile/unfollow/:user_id", to: "profiles#unfollow"
end
