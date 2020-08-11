class PaymentStatus < ApplicationRecord
    has_many :payment_intent
    has_many :payment
end
