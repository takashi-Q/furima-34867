class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :new]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :redirect_method, only: [:edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :area_id, :days_ship_id,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def redirect_method
    redirect_to root_path if @item.user != current_user
  end
end
