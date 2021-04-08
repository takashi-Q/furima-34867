class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end
end

private

def item_params
  params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :area_id, :days_ship_id,
                               :price).merge(user_id: current_user.id)
end
