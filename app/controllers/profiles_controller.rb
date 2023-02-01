class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # ! ユーザ情報
    @user = User.find(params[:id])
  end

  def follow
    # ! ユーザをフォローする refererは遷移する前のリンクに遷移する
    follow = Follow.new(followed: current_user.id, follower: params[:user_id])

    if follow.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def follow_destroy
    follow_destroy = Follow.find_by(followed: current_user.id, follower: params[:user_id])

    if follow_destroy.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def follow_list
    # * ユーザがフォローしている人のuser_idを取得
    @follow_lists = Follow.where(followed: params[:user_id])
  end

  def follower_list
    # * ユーザがフォローしている人のuser_idを取得
    @follower_lists = Follow.where(follower: params[:user_id])
  end
end
