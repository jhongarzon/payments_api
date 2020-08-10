class StockMovementStockMovementTypeForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :stock_movements, :stock_movement_types
  end
end
