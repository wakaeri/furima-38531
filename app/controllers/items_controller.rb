class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create_table
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :information, :status_id, :delivery_charge_id, :prefecture_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end

end
