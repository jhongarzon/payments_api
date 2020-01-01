FactoryBot.define do
  factory :product do
    category_id { 1 }
    code { "MyString" }
    name { "MyString" }
    description { "MyString" }
    price { "9.99" }
    currency_id { 1 }
    image { "MyString" }
    categories { nil }
  end
end
