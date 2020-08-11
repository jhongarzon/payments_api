class CurrencyResource < ApplicationResource
  attribute :name, :string
  attribute :description, :string
  has_many :products
  has_many :payment_intent
  has_many :payment
end
