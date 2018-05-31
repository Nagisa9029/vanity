class CreateLoves < ActiveRecord::Migration[5.1]
  def change
    create_table :loves do |t|

      t.references :column, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
