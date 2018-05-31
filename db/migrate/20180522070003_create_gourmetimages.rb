class CreateGourmetimages < ActiveRecord::Migration[5.1]
  def change
    create_table :gourmetimages do |t|

      t.timestamps
    end
  end
end
