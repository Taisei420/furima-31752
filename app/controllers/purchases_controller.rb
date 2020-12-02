class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(buy_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private


  def buy_params
    params.require(:purchase_address).permit(:potal_code, :shipping_area_id, :municipality, :block, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
