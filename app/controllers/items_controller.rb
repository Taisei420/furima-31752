class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    ＠items = Item.all
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


  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:condition_id,:shipping_charges_id,:shipping_area_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end
  
end
