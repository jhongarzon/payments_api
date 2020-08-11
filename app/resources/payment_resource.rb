class PaymentResource < ApplicationResource
  attribute :client_secret, :string
  attribute :amount, :big_decimal
  attribute :receipt_email, :string
  attribute :cancelled_at, :datetime
  attribute :cancellation_reason, :string

  belongs_to :payment_intent
  belongs_to :client
  belongs_to :currency
  belongs_to :payment_status
end
