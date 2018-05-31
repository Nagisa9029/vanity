class AddReadFlgToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :read_flg, :boolean
  end
end
