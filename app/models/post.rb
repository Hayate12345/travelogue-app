class Post < ApplicationRecord
  # ! リレーションの記述 1にあたるモデル名を単数形で書く)
  belongs_to :user

  # ! バリデーションの設定
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
end
