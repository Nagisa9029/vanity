class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|

      t.text :post_comment
      t.references :user, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.timestamps
    end
  end
end
