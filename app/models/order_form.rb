class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :city, :address, :building_name, :cellphone_number, :item_id, :user_id, :order_id

  with_options presence: true do
  validates :postal_code
  validates :prefectures_id
  validates :city
  validates :address
  validates :cellphone_number
  end
  validates :prefectures_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :cellphone_number, format: { with: /\A\d{10,11}\z/}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefectures_id: prefectures_id, city: city, address: address, building_name: building_name, cellphone_number: cellphone_number, order_id: order.id)
  end
end
