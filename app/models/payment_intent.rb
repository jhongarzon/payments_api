class PaymentIntent < ApplicationRecord
  belongs_to :client
  belongs_to :currency
  belongs_to :payment_status
end
