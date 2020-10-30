FactoryBot.define do
  factory :order_form do
    postal_code      { "111-1111" }
    prefectures_id   { 2 }
    city             { "船橋市" }
    address          {"3丁目"}
    cellphone_number { "08054643873" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
