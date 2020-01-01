class CreateProductStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :product_stocks do |t|
      t.string :product_id
      t.integer :quantity
      t.belongs_to :products, null: false, foreign_key: true

      t.timestamps
    end
  end
end
