class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :code
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :currency_id
      t.string :image
      t.belongs_to :categories, null: false, foreign_key: true

      t.timestamps
    end
  end
end
