Rails.application.routes.draw do
  devise_for :users
  get "/post", to: "posts#index"
  get "/post/new", to: "posts#new"
  post "/post/create", to: "posts#create"

  get "/profile", to: "profiles#index"
  get "/profile/show/:id", to: "profiles#show"

  post "/profile/follow/:user_id", to: "profiles#follow"
  delete "/profile/follow_destroy/:user_id", to: "profiles#follow_destroy"

  post "/post/like/:post_id", to: "posts#create_like"
  delete "/post/like_destroy/:post_id", to: "posts#destroy_like"
end
