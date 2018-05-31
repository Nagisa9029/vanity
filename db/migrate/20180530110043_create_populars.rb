class CreatePopulars < ActiveRecord::Migration[5.1]
  def change
    create_table :populars do |t|

      t.references :gourmet, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
