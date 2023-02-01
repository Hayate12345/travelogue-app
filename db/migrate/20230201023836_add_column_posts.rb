class AddColumnPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :tag1, :string
    add_column :posts, :tag2, :string
    add_column :posts, :tag3, :string
    add_column :posts, :tag4, :string
    add_column :posts, :tag5, :string
  end
end
