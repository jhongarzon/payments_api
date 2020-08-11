class Payment < ApplicationRecord
  belongs_to :payment_intent
  belongs_to :client
  belongs_to :currency
  belongs_to :payment_status
end
