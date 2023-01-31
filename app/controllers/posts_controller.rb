class PostsController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: "DESC")
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

  private

  def posts_params
    params.require(:post).permit(:title, :content, :image)
  end
end
