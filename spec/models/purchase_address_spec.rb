require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品が購入できる時' do
      it 'クレジットカード情報と配送先の情報があれば購入できる' do
        expect(@purchase_address).to be_valid
      end

      it 'building_numberが空でも登録できる' do
        @purchase_address.building_number = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it 'potal_codeが空では登録できない' do
        @purchase_address.potal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Potal code can't be blank")
      end

      it 'potal_codeにハイフンがなければ登録できない' do
        @purchase_address.potal_code = 1234567
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Potal code is invalid")
      end

      it 'shipping_area_idが空では登録できない' do
        @purchase_address.shipping_area_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_area_idが0の場合出品できない' do
        @purchase_address.shipping_area_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping area must be other than 0")
      end

      it 'municipalityが空では登録できない' do
        @purchase_address.municipality = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'blockが空では登録できない' do
        @purchase_address.block = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは11桁以内でなければ登録できない' do
        @purchase_address.phone_number = '012345678901'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberはハイフンがあれば登録できない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

      it 'tokenが空では登録できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
