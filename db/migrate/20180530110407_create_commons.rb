class CreateCommons < ActiveRecord::Migration[5.1]
  def change
    create_table :commons do |t|

      t.text :image_id
      t.string :common_title
      t.text :common_body
      t.string :common_category
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
