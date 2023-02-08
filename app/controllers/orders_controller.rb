class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
  end

  def create
    @order = Order.create(order_params)
    DeliceryAddress.create(address_params)
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:order).merge(user_id: current_user.id, item_id: current_item.id )
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: @order.id)
  end
end