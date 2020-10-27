class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :DeliveryCharge
  belongs_to_active_hash :ShippingArea
  belongs_to_active_hash :DeliveryDay

  belongs_to :user
  has_one_attached :image

  validates :name, :description, :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :delivery_day_id, :image, :price, presence: true

  validates :category_id, :status_id, :delivery_charge_id, :shipping_area_id, :delivery_day_id, numericality: { other_than: 1 }

  validates :price, inclusion: { in: 300..9_999_999 }
end
