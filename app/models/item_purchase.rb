class ItemPurchase < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :purchase_info
end
