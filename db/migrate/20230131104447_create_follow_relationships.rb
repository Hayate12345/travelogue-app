class CreateFollowRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :follow_relationships do |t|
      # ! referenceで外部キーを参照できる
      # ! foreign_idは存在しない値を参照させないためにかく usersテーブルの値を参照させるために{ to_table: :users }を書く
      t.references :user, foreign_key: { to_table: :users }
      t.references :follow, foreign_key: { to_table: :users }
      t.timestamps

      # ! user_id=1のユーザーが、follow_id=2のユーザーをフォローしているという状況は1つだけ
      # ! その規約を追加する
      t.index %i[ user_id follow_id ], unique: true
    end
  end
end
