FactoryBot.define do
  factory :item do
    name             { '写真' }
    price            { '500' }
    description      { '限定' }
    delivery_charge_id {' 2 '}
    shipping_area_id { '2' }
    delivery_day_id     { '2' }
    category_id   { '2' }
    status_id     { '2' }
    user_id     { '1' }
    # association :user
    # association :category
    # association :delivery_charge
    # association :shipping_area
    # association :status
    # association :delivery_day

    after(:build) do |it|
      it.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
