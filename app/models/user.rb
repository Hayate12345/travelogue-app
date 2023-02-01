class User < ApplicationRecord
  # ! リレーションの記述 多にあたるモデル名を複数形で書く)
  has_many :posts

  # ! likesテーブルとのアソシエーション こっちが親
  # ! 親（投稿者）が消えたらそれに紐ずくいいねも消えるように設定
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable

  # ! フォロー、フォロワーのアソシエーション書き方がわからん
end
