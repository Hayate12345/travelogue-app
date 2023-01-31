class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # ! ユーザ情報
    @user = User.find(params[:id])
  end

  def follow
    # ! ユーザをフォローする
    @post_like = Follow.new(followed: current_user.id, follower: params[:user_id])
    @post_like.save
    redirect_to action: :index
  end

  def follow_destroy
    Follow.find_by(followed: current_user.id, follower: params[:user_id]).destroy
    redirect_to action: :index
  end
end
