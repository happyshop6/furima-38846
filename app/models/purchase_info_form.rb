class PurchaseInfoForm
  include ActiveModel::Model
  attr_accessor :user, :product, :postal_code, :city, :address, :prefecture_id, :building_name, :phone_number,:token

  with_options presence: true do
    validates :user
    validates :product
  
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    item_purchase = ItemPurchase.create(user: user, product: product)
    PurchaseInfo.create(item_purchase: item_purchase, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end