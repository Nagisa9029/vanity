class CreateColumns < ActiveRecord::Migration[5.1]
  def change
    create_table :columns do |t|

      t.text :image_id
      t.string :c_title
      t.text :c_body
      t.string :c_category
      t.boolean :c_flg
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
