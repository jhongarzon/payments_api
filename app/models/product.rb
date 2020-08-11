class Product < ApplicationRecord
  belongs_to :category
  belongs_to :currency
  has_one :product_stock 
end
