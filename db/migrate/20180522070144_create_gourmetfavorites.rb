class CreateGourmetfavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :gourmetfavorites do |t|

      t.timestamps
    end
  end
end
