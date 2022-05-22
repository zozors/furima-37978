class Item < ApplicationRecord
  belongs_to :user

  validates :image, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validates :situation_id, presence: true
  validates :burden_of_shipping_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true
end