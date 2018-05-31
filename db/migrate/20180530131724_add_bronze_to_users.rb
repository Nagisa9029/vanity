class AddBronzeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bronze, :boolean
    add_column :users, :silver, :boolean
    add_column :users, :gold, :boolean
    add_column :users, :platinum, :boolean
  end
end
