class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  
  def index
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      if @item.order == nil
        @order_address = OrderAddress.new
      else
        redirect_to root_path
      end
    end
  end

  
  def create
    
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      

      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_address_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: order_address_params[:token],    
      currency: 'jpy'                 
    )
  end
end