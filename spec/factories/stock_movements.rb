FactoryBot.define do
  factory :stock_movement do
    stock_movement_type_id { "" }
    client_id { "" }
    product { nil }
  end
end
