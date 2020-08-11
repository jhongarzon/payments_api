class Client < ApplicationRecord
    has_secure_password
    has_many :payment_intent
    has_many :payment
end
