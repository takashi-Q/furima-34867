class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :order_item, only: [:index]
  def index
    @orderpurchaser = Orderpurchaser.new
    @item = Item.find(params[:item_id])
  end

  def create
    @orderpurchaser = Orderpurchaser.new(orderpurchaser_params)
    @item = Item.find(params[:item_id])

    if @orderpurchaser.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp.api_key = 'sk_test_0efe6a61722aa95c64e454cc'  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: orderpurchaser_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
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

  def order_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchaser.nil?
  end
end
