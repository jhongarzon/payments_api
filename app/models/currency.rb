class Currency < ApplicationRecord
    has_many :products
    has_many :payment_intent
    has_many :payment
end
