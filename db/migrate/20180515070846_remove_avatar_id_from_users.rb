class RemoveAvatarIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatar_id, :text
    add_column :users, :image_id, :text
  end
end
