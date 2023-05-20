class ItemPurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :city, :address, :prefecture_id, :building_name, :phone_number,:token

  with_options presence: true do
    validates :user_id
    validates :product_id
  
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create(user_id: user_id, product_id: product_id)
    ItemPurchaseInfos.create(item_purchase_id: item_purchase.id, postal_code: postal_code, prefecture_id: prefecture.id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end