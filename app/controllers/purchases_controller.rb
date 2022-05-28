class PurchasesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchese_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture, :municipalities, :address, :building_name, :telephone_number).merge(purchase_id: @purchase.id)
  end
end
