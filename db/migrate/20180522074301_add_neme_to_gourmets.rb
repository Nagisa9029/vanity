class AddNemeToGourmets < ActiveRecord::Migration[5.1]
  def change
    add_column :gourmets, :name, :string
    add_column :gourmets, :name_kana, :string
    add_column :gourmets, :category, :string
    add_column :gourmets, :tel, :date
    add_column :gourmets, :postal_code, :string
    add_column :gourmets, :address, :string
    add_column :gourmets, :street, :string
    add_column :gourmets, :url, :string
    add_column :gourmets, :pr, :text
    add_column :gourmets, :g_flg, :boolean
    add_reference :gourmets, :user, foreign_key: true
  end
end
