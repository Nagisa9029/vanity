class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|

      t.string :winename
      t.string :o_winename
      t.string :vintage
      t.string :category
      t.string :aoc
      t.string :sepage
      t.string :r_price
      t.string :s_price
      t.string :region
      t.string :comment
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
