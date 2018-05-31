class RemoveImageIdFromColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :columns, :image_id, :text
  end
end
