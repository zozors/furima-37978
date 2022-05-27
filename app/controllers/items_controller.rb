class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]
  
  

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :situation_id, :burden_of_shipping_charge_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
      unless current_user.id == @item.user_id
        redirect_to action: :index
      end
  end

  def set_item
    @item = Item.find(params[:id])
  end

 
end
