FactoryBot.define do
  factory :payment_intent do
    client_secret { "MyString" }
    amount { "9.99" }
    payment_method_type { "MyString" }
    receipt_email { "MyString" }
    client { nil }
    currency { nil }
    payment_status { nil }
  end
end
