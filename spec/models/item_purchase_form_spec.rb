require 'rails_helper'

RSpec.describe ItemPurchaseForm, type: :model do
  before do
    @item_purchase_form = FactoryBot.build(:item_purchase_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_purchase_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @item_purchase_form.user_id = 1
        expect(@item_purchase_form).to be_valid
      end
      it 'product_idが空でなければ保存できる' do
        @item_purchase_form.product_id = 1
        expect(@item_purchase_form).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @item_purchase_form.postal_code = '123-4567'
        expect(@item_purchase_form).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @item_purchase_form.prefecture_id = 1
        expect(@item_purchase_form).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @item_purchase_form.city = '津市'
        expect(@item_purchase_form).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @item_purchase_form.address = '港区１２３'
        expect(@item_purchase_form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @item_purchase_form.building_name = nil
        expect(@item_purchase_form).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @item_purchase_form.phone_number = 12_345_678_910
        expect(@item_purchase_form).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @item_purchase_form.user_id = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空だと保存できない' do
        @item_purchase_form.item_id = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Product can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @item_purchase_form.postal_code = nil
        @item_purchase_form.valid?
        expect(@item_purchaser_form.errors.full_messages).to include("PostalCode can't be blank",
                                                                     'PostalCode is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @item_purchase_form.postal_code = 1_234_567
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include('PostalCode is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @item_purchase_form.prefecture_id = 0
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @item_purchase_form.prefecture_id = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @item_purchase_form.city = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @item_purchase_form.address = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @item_purchase_form.phone_number = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @item_purchase_form.phone_number = '123 - 1234 - 1234'
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @item_purchase_form.phone_number = 12_345_678_910_123_333
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @item_purchase_form.token = nil
        @item_purchase_form.valid?
        expect(@item_purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
