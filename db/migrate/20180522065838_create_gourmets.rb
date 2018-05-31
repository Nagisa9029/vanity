class CreateGourmets < ActiveRecord::Migration[5.1]
  def change
    create_table :gourmets do |t|

      t.timestamps
    end
  end
end
