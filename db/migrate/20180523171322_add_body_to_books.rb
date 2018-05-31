class AddBodyToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :body, :text
    add_column :books, :image_id, :text
  end
end
