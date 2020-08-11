FactoryBot.define do
  factory :payment do
    client_secret { "MyString" }
    amount { "9.99" }
    receipt_email { "MyString" }
    cancelled_at { "2020-08-11 15:39:19" }
    cancellation_reason { "MyString" }
    payment_intent { nil }
    client { nil }
    currency { nil }
    payment_status { nil }
  end
end
