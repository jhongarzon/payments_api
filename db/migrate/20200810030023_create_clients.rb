class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.string :phone, null: false

      t.timestamps
    end
  end
end
