FactoryBot.define do
  factory :item do
    title              {'題名'}
    text               {'説明文'}
    area_id               {2}
    status_id             {2}
    category_id           {2}
    delivery_id           {2}
    day_id                {2}
    price              {2000}
    image              {Faker::Lorem.sentence}
    association :user
  end
end