class PaymentIntentResource < ApplicationResource
  attribute :client_secret, :string
  attribute :amount, :big_decimal
  attribute :payment_method_type, :string
  attribute :receipt_email, :string
  
  belongs_to :client
  belongs_to :currency
  belongs_to :payment_status
end
