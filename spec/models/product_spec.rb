require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品の出品登録' do
    context '出品登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@product).to be_valid
      end
      it 'カテゴリーが「---」以外であれば登録できる' do
        @product.category_id = 1
        expect(@product).to be_valid
      end
      it '商品の状態が「---」以外であれば登録できる' do
        @product.condition_id = 1
        expect(@product).to be_valid
      end
      it '配送料の負担が「---」以外であれば登録できる' do
        @product.postage_type_id = 1
        expect(@product).to be_valid
      end
      it '発送元の地域が「---」以外であれば登録できる' do
        @product.prefecture_id = 1
        expect(@product).to be_valid
      end
      it '発送までの日数が「---」以外であれば登録できる' do
        @product.preparation_day_id = 1
        expect(@product).to be_valid
      end
      it '価格が半角数字でかつ300円〜9,999,999円であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end

    context '出品ができないとき' do
      it '１枚画像がないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @product.explanation = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が「---」だと出品できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 0')
      end
      it 'カテゴリーの情報が空欄だと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態の情報が「---」だと出品できない' do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Condition must be other than 0')
      end
      it '商品の状態の情報が空欄だと出品できない' do
        @product.condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
      end
      it '配送料の負担の情報が「---」だと出品できない' do
        @product.postage_type_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Postage type must be other than 0')
      end
      it '配送料の負担の情報が空欄だと出品できない' do
        @product.postage_type_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage type can't be blank", 'Postage type is not a number')
      end
      it '発送元の地域の情報が「---」だと出品できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送元の地域の情報が空欄だと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送までの日数の情報が「---」だと出品できない' do
        @product.preparation_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include('Preparation day must be other than 0')
      end
      it '発送までの日数の情報が空欄だと出品できない' do
        @product.preparation_day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Preparation day can't be blank", 'Preparation day is not a number')
      end
      it '価格が空欄だと出品できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end
      it '価格の範囲が、300円未満だと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格の範囲が、9,999,999円を超えると出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @product.price = '３３３３３'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
