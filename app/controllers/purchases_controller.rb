class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchase, only: [:index, :create]
  
  def index
    @purchase_address = PurchaseAddress.new
    if current_user.id == @item.user.id || @item.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(buy_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private


  def buy_params
    params.require(:purchase_address).permit(:potal_code, :shipping_area_id, :municipality, :block, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token] )
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end


end
