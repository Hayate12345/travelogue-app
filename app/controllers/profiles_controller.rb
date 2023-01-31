class ProfilesController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # ! ユーザ情報
    @user = User.find(params[:id])

    @user_follow = FollowRelationship.find_by(follow_id: @user.id)
  end

  def follow
    # ! ユーザをフォローする
    FollowRelationship.create(user_id: current_user.id, follow_id: params[:user_id])
    redirect_to action: :index
  end

  def unfollow
    FollowRelationship.find_by(user_id: current_user.id, follow_id: params[:user_id]).destroy
    redirect_to action: :index
  end
end
