class PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: "DESC")

    # ! .exists?はtrueかfalseを返す
    # @like_check = Like.exists?(user_id: current_user.id, post_id: "1")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(posts_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  # ! 投稿にいいねする
  def create_like
    @post_like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    @post_like.save
    redirect_to action: :index
  end

  # ! 投稿のいいね解除
  def destroy_like
    @post_like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    @post_like.destroy
    redirect_to action: :index
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :image)
  end
end
