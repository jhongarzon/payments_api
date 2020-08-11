class PaymentStatusResource < ApplicationResource
  attribute :name, :string
  has_many :payment_intent
  has_many :payment
end
