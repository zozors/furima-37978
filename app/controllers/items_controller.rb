class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, ]
  before_action :move_to_index, except: [:index, :show, :search]
  

  def index
    @items = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
      redirect_to item_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :situation_id, :burden_of_shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to action: :index
    end
  end

end
