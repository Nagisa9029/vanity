class CreateGourmetcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :gourmetcomments do |t|

      t.text :g_comment
      t.references :user, index: true, foreign_key: true
      t.references :gourmet, index: true, foreign_key: true
      t.timestamps
    end
  end
end
