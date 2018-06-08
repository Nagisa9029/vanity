class RemoveCommentFromLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :comment, :string
    add_column :lists, :comment, :text
  end
end
