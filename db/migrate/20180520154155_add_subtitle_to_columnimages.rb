class AddSubtitleToColumnimages < ActiveRecord::Migration[5.1]
  def change
    add_column :columnimages, :subtitle, :string
    add_column :columnimages, :subbody, :text
  end
end
