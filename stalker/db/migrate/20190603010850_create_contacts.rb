class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :nome
      t.string :guid

      t.timestamps
    end
    add_index :contacts, :email, unique: true
  end
end
