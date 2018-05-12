class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.text :image_id
      t.string :p_title
      t.text :p_body
      t.string :p_category
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
