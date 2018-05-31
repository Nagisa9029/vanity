class CreateColumnimages < ActiveRecord::Migration[5.1]
  def change
    create_table :columnimages do |t|

      t.text :image_id
      t.references :column, index: true, foreign_key: true
      t.timestamps
    end
  end
end
