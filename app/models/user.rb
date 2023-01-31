class User < ApplicationRecord
  # ! リレーションの記述 多にあたるモデル名を複数形で書く)
  has_many :posts

  # ! likesテーブルとのアソシエーション こっちが親
  # ! 親（投稿者）が消えたらそれに紐ずくいいねも消えるように設定
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  # ! フォロー、フォロワーテーブルのアソシエーションを定義する
  # * 複数のfollow_relationshipsを持つため、has_many
  # has_many :following_relationships, class_name: "FollowRelationship", foreign_key: "user_id"
  # has_many :followwer_relationships, class_name: "FollowRelationship", foreign_key: "follow_id"

  # * テーブルの出口を作るイメージ belongs_toにつながる記述
  # has_many :followings, through: :following_relationships, source: :follow
  # has_many :followers, through: :follower_relationships, source: :user
end
