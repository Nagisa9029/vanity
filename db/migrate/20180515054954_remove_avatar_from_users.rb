class RemoveAvatarFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :avatar, :string
    add_column :users, :avatar_id, :text
  end
end
