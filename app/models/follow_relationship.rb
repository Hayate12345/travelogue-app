class FollowRelationship < ApplicationRecord
  # ! usersテーブルに所属しているためbelongs_toでかく
  belongs_to :user
  # ! 存在しないfollowというテーブルを参照しないようにUserモデルウィ指定する
  belongs_to :follow, class_name: "User"
end
