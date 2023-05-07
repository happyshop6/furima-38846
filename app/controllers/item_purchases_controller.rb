class ItemPurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item_purchase_form = ItemPurchaseForm.new
    @product = Product.find(params[:product_id])
  end

  def create
    @item_purchase_form = ItemPurchaseForm.new(item_purchase_params)
    @product = Product.find(params[:product_id]
    if @item_purchase_form.valid?
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
end
