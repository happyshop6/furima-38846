class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :item_purchases

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    validates :nickname, presence: true
    # 自動  validates :email,    uniqueness: true
    # 自動　validates :password,  presence: true, length: { minimum: 6 }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :read_first, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :read_family, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth, presence: true
  end
end
