class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    #@items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
  end

  
end

private

def item_params
  params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
end

def move_to_index
  return if user_signed_in?

  redirect_to action: :index
end
