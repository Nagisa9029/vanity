class AddCountryToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :country, :string
  end
end
