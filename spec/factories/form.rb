FactoryBot.define do
  factory :form do
    zip_code {'123-4567'}
    area_id  { 2 }
    city     {'東京都新宿区'}
    address1 {'青山1-1-1'}
    telephone {'01234567890'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
