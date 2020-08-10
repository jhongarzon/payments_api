class ProductStockResource < ApplicationResource
  attribute :product_id, :integer
  attribute :quantity, :integer
  belongs_to :product
end
