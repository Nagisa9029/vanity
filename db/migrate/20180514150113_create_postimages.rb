class CreatePostimages < ActiveRecord::Migration[5.1]
  def change
    create_table :postimages do |t|

      t.text :image_id
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
