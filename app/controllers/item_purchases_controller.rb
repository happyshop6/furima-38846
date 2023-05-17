class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_product, only: [:index, :create]

  def index
    @item_purchase_form = ItemPurchaseForm.new
  end

  def create
    @item_purchase_form = ItemPurchaseForm.new(item_purchase_params)
    if @item_purchase_form.valid?
      pay_product
      @item_purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_purchase_params
    params.require(:item_purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: item_purchase_params[:price],        # 商品の値段
      card: item_purchase_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_product
      @product = Product.find(params[:product_id])
      redirect_to root_path if current_user.id == @product.user_id || @product.item_purchase.present?
  end
end
