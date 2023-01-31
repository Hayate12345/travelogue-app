class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :followed
      t.integer :follower
      t.timestamps
    end
  end
end
