class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :image
      t.string :content
      t.timestamps
    end
  end
end
