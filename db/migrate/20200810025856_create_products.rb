class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :description
      t.decimal :price
      t.string :image
      t.boolean :is_enabled
      t.bigint :currency_id
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
