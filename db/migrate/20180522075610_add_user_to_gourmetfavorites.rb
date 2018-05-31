class AddUserToGourmetfavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :gourmetfavorites, :user, foreign_key: true
    add_reference :gourmetfavorites, :gourmet, foreign_key: true
  end
end
