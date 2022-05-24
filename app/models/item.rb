class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :burden_of_shipping_charge
  belongs_to :prefecture
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :category_id, :situation_id, :burden_of_shipping_charge_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1, message: "can't be blank" }

  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :situation_id, presence: true, numericality: { other_than: 1 }
  validates :burden_of_shipping_charge_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: { message: "can't be blank" }
end
