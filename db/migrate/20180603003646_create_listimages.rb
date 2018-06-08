class CreateListimages < ActiveRecord::Migration[5.1]
  def change
    create_table :listimages do |t|

      t.text :image_id
      t.references :list, index: true, foreign_key: true
      t.timestamps
    end
  end
end
