class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Prefecture
  belongs_to :order

  validates :prefectures_id, numericality: { other_than: 1 }
end
