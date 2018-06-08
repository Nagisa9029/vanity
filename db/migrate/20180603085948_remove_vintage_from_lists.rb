class RemoveVintageFromLists < ActiveRecord::Migration[5.1]
  def change
    remove_column :lists, :vintage, :string
    remove_column :lists, :r_price, :string
    remove_column :lists, :s_price, :string
  end
end
