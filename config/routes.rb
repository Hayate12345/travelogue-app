Rails.application.routes.draw do
  # ! ログイン、会員登録のルーティング
  devise_for :users

  # ! 投稿関連のルーティング
  # * 投稿一覧関連
  get "/post", to: "posts#index"
  get "/post/show/:post_id", to: "posts#show"
  # * 新規投稿関連
  get "/post/new", to: "posts#new"
  post "/post/create", to: "posts#create"
  # *投稿編集関連
  get "/post/edit/:post_id", to: "posts#edit"
  patch "/post/update/:post_id", to: "posts#update"
  # *　投稿いいね関連
  post "/post/like_create/:post_id", to: "posts#like_create"
  delete "/post/like_destroy/:post_id", to: "posts#like_destroy"

  get "/profile", to: "profiles#index"
  get "/profile/show/:id", to: "profiles#show"

  post "/profile/follow/:user_id", to: "profiles#follow"
  delete "/profile/follow_destroy/:user_id", to: "profiles#follow_destroy"

  get "/profile/follow_list/:user_id", to: "profiles#follow_list"
  get "/profile/follower_list/:user_id", to: "profiles#follower_list"
end
