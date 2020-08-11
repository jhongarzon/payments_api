class ClientResource < ApplicationResource
  attribute :name, :string
  attribute :last_name, :string
  attribute :address, :string
  attribute :email, :string
  attribute :username, :string
  attribute :password, :string
  attribute :phone, :string
   has_many :payment_intent
    has_many :payment
end
