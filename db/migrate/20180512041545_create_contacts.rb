class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|

      t.string :contact_name
      t.text :question
      t.text :re_question
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
