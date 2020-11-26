require 'rails_helper'

RSpec.describe Item, type: :model do
  before do 
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる時' do
      it 'バリデーションが機能すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it "nameが空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "descriptionが空では登録できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it "category_idが空では登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "condition_idが空では登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "shipping_charges_idが空では登録できない" do
        @item.shipping_charges_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end

      it " shipping_area_idが空では登録できない" do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it "shipping_day_idが空では登録できない" do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "priceが半角数字でなければ登録できない" do
        @item.price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
