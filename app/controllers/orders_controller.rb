class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item,           only: [:index, :create]
  def index
    move_to_index
    @order_address = OrderAddress.new
  end

  def create
    move_to_index
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_order_address
      @order_address.save
      redirect_to root_path
    else
      @order_address = OrderAddress.new 
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user == @item.user 
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_order_address
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
