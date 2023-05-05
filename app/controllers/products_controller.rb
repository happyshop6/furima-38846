class ProductsController < ApplicationController
  before_action :move_to_signed_in, except: [:index, :show]

  before_action :set_product, only: [:show, :edit, :update]

  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @product.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path, notice: ''
    else
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id,
                                    :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    return if user_signed_in?

    redirect_to '/users/sign_in'
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
