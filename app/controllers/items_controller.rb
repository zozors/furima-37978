class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:title, :content, :category_id, :situation_id, :burden_of_shipping_charge_id, :prefecture_id, :shipping_day_id, :price)
  end
end