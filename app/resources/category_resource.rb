class CategoryResource < ApplicationResource
  attribute :name, :string
  attribute :description, :string
  has_many :products
end
