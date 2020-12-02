require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = Factorybot.create(:user)
    @item = Factorybot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: params[:item_id])
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'クレジットカード情報と配送先の情報があれば購入できる'
      end
    end

    context '商品が購入できない時' do
      it 'potal_codeが空では登録できない' do
      end

      it 'potal_codeにハイフンがなければ登録できない' do
      end

      it 'shipping_area_idが空では登録できない' do
      end

      it 'municipalityが空では登録できない' do
      end

      it 'blockが空では登録できない' do
      end

      it 'phone_numberが空では登録できない' do
      end

      it 'phone_numberは11桁以内でなければ登録できない' do
      end
    end
  end
end
