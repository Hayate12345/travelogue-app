class Post < ApplicationRecord
  # ! リレーションの記述 1にあたるモデル名を単数形で書く)こっちが子
  belongs_to :user

  # ! likesテーブルとのアソシエーション こっちが親
  # ! 親（投稿）が消えたらそれに紐ずくいいねも消えるように設定
  has_many :likes, dependent: :destroy

  # ! バリデーションの設定
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end
