FactoryBot.define do
  factory :item do
    item_name           { "パソコン" }
    category_id         { 2 }
    information         { "説明文章" }
    status_id           { 2 }
    delivery_charge_id  { 2 }
    prefecture_id       { 3 }
    days_to_delivery_id { 2 }
    price               { 100000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

