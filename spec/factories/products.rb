FactoryBot.define do
  factory :product do
    code { "MyString" }
    name { "MyString" }
    description { "MyString" }
    price { "9.99" }
    image { "MyString" }
    is_enabled { false }
    currency_id { "" }
    category { nil }
  end
end
