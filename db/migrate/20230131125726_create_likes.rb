class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      # ! nullを認めない、存在しない値の参照を認めない
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.timestamps
      # ! 一つの投稿にユーザがいいねできる状況は一つだけ
      t.index %i[ user_id follow_id ], unique: true
    end
  end
end
