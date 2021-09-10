FactoryBot.define do
  factory :item do
    title              { '題名' }
    text               { '説明文' }
    area_id               { 2 }
    status_id             { 2 }
    category_id           { 2 }
    delivery_id           { 2 }
    day_id                { 2 }
    price              { 2000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
