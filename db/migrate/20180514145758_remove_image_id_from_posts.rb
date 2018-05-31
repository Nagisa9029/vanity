class RemoveImageIdFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :image_id, :text
  end
end
