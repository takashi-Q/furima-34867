class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :order_item, only: [:index]
  before_action :item_find, only: [:index,:create]
  def index
    @orderpurchaser = Orderpurchaser.new
    
  end

  def create
    @orderpurchaser = Orderpurchaser.new(orderpurchaser_params)
   

    if @orderpurchaser.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: orderpurchaser_params[:token], 
        currency: 'jpy'               
      )
      @orderpurchaser.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def orderpurchaser_params
    params.require(:orderpurchaser).permit(:postal_code, :area_id, :municipality, :adress, :building_name, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def order_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchaser.nil?
  end
end
