class StockMovementResource < ApplicationResource
  attribute :stock_movement_type_id, :integer
  attribute :client_id, :integer
  attribute :product_id, :string
end
