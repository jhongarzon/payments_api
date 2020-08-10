class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :description
      t.decimal :price, null: false
      t.string :image
      t.boolean :is_enabled, default: true
      t.bigint :currency_id, null: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
