class AddVintageToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :vintage, :date
    add_column :lists, :r_price, :integer
    add_column :lists, :s_price, :integer
    add_column :lists, :domaine, :string
    add_column :lists, :o_domaine, :string
  end
end
