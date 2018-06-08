class AddSceneToLists < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :scene, :string
  end
end
