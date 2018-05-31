class AddImageIdToGourmetimages < ActiveRecord::Migration[5.1]
  def change
    add_column :gourmetimages, :image_id, :text
    add_reference :gourmetimages, :gourmet, foreign_key: true
  end
end
