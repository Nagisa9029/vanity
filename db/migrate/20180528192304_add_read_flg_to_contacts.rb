class AddReadFlgToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :read_flg, :boolean
  end
end
