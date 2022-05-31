class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :purchase_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :address
    validates :telephone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end