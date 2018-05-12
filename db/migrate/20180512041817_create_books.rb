class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|

      t.string :word
      t.string :meaning
      t.timestamps
    end
  end
end
