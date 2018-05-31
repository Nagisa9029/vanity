class AddReadFlgToGourmetcomments < ActiveRecord::Migration[5.1]
  def change
    add_column :gourmetcomments, :read_flg, :boolean
  end
end
