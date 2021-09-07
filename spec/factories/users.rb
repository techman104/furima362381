FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    first_name            { '山田' }
    family_name           { '太郎' }
    first_name_kana       { 'ヤマダ' }
    family_name_kana      { 'タロウ' }
    birth_day             { '1997-09-07' }
  end
end
