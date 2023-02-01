class ProfilesController < ApplicationController
  # * ユーザ情報一覧を表示する これはいらんかな
  def index
    @users = User.all
  end

  # ! ユーザ情報を表示するメソッド
  def show
    @user = User.find(params[:user_id])
  end

  # ! ユーザ情報を編集する （編集フォーム表示） メソッド
  def edit
    @user = User.find(params[:user_id])

    # * ログイン者でない場合リダイレクトする
    if @user.id != current_user.id
      render :show
    end
  end

  # ! ユーザ情報を編集するメソッド
  def update
    @user = User.find(params[:user_id])

    # * ログイン者でない場合リダイレクトする
    if @user.id != current_user.id
      redirect_to action: :index
    end

    if @user.update(users_params)
      render :show
    else
      render :show
    end
  end

  # ! ユーザをフォローするメソッド
  def follow
    # * フォローボタンが押されたらフォローしたユーザとフォローされた投稿情報を保存する
    follow = Follow.new(followed: current_user.id, follower: params[:user_id])

    # * フォローが成功したらリダイレクト、失敗したらエラーメッセージ
    if follow.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # ! ユーザのフォローを解除するメソッド
  def follow_destroy
    # * フォロー解除ボタンが押されたらフォローしたユーザとフォローされた投稿情報を削除する
    follow_destroy = Follow.find_by(followed: current_user.id, follower: params[:user_id])

    # * フォロー解除が成功したらリダイレクト、失敗したらエラーメッセージ
    if follow_destroy.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # ! 自分がフォローしている人を表示するメソッド
  def follow_list
    # * ユーザがフォローしている人のuser_idを取得
    @follow_lists = Follow.where(followed: params[:user_id])
  end

  # ! 自分をフォローしてくれている人を表示するメソッド
  def follower_list
    # * ユーザがフォローしている人のuser_idを取得
    @follower_lists = Follow.where(follower: params[:user_id])
  end

  private

  def users_params
    params.require(:user).permit(:name, :profile, :icon)
  end
end
