class AddIndicesToPostsTable < ActiveRecord::Migration
  def change
    add_index :posts, [:author_id, :sub_id]
  end
end
