class CreateListlovers < ActiveRecord::Migration[5.1]
  def change
    create_table :listlovers do |t|

      t.references :list, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
