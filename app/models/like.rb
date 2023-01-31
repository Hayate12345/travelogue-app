class Like < ApplicationRecord
  # ! usersテーブルとのアソシエーション　こっちが子
  belongs_to :user
  # ! postsテーブルとのアソシエーション こっちが子
  belongs_to :post
end
