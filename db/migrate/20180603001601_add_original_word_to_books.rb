class AddOriginalWordToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :original_word, :string
  end
end
