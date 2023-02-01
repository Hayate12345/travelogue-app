class PostsController < ApplicationController
  # ! 投稿一覧を取得するメソッド
  def index
    # * 更新時間が早い順に取得する
    @posts = Post.all.order(updated_at: "DESC")
  end

  # ! 新規投稿する （投稿フォーム） メソッド
  def new
    # * フォームに定義するためのインスタンス化
    @post = Post.new
  end

  # ! 新規投稿するメソッド
  def create
    # * パラメータのバインド
    @post = Post.new(posts_params)

    # * 投稿者の情報を保存
    @post.user_id = current_user.id

    # * 投稿に成功したらリダイレクト、失敗したらエラーを出力
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  # ! 投稿の詳細を表示するメソッド
  def show
    # * 詳細表示する投稿を一件取得
    @post = Post.find(params[:post_id])
  end

  # ! 投稿内容を更新する （編集フォーム） メソッド
  def edit
    @post = Post.find(params[:post_id])

    # * 投稿者でない場合リダイレクトする
    if @post.user.id != current_user.id
      redirect_to action: :index
    end
  end

  # ! 投稿内容を更新するメソッド
  def update
    # *
    @post = Post.find(params[:post_id])

    # * 投稿者でない場合リダイレクトする
    if @post.user.id != current_user.id
      redirect_to action: :index
    end

    # * 投稿に成功したらリダイレクト、失敗したらエラーを出力
    if @post.update(posts_params)
      render :show
    else
      render :new
    end
  end

  # ! 投稿を削除するメソッド
  def destroy
    @post = Post.find(params[:post_id])

    # * 投稿者でない場合リダイレクトする
    if @post.user.id != current_user.id
      redirect_to action: :index
    end

    # * 削除に成功したらリダイレクト、失敗したらエラーを出力
    if @post.destroy
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  # ! 投稿にいいねするメソッド
  def like_create
    # * いいねボタンが押されたらいいねしたユーザといいねされた投稿情報を保存する
    like_create = Like.new(user_id: current_user.id, post_id: params[:post_id])

    # * いいねに成功したらリダイレクトと完了通知、失敗したら失敗通知を出力
    if like_create.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # ! 投稿のいいね解除をするメソッド
  def like_destroy
    # * いいね解除ボタンが押されたらいいねしたユーザといいねされた投稿情報を削除する
    like_destroy = Like.find_by(user_id: current_user.id, post_id: params[:post_id])

    # * いいねに成功したらリダイレクトと完了通知、失敗したら失敗通知を出力
    if like_destroy.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :image, :tag1, :tag2, :tag3, :tag4, :tag5)
  end
end
