class ItemPurchase < ApplicationRecord
  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
  
  belongs_to :user
  belongs_to :product
  has_one :purchase_info
end
