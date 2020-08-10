class StockMovementClientForeignKey < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :stock_movements, :clients
  end
end
