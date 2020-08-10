class ProductResource < ApplicationResource
  attribute :code, :string
  attribute :name, :string
  attribute :description, :string
  attribute :price, :big_decimal
  attribute :image, :string
  attribute :is_enabled, :boolean
  attribute :currency_id, :integer
  belongs_to :category
  has_one :product_stock
end
