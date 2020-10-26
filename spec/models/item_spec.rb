require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品画像がなければ出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がなければ出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がなければ出品できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報がなければ出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it '商品の状態の情報がなければ出品できない' do
    @item.status_id = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Status is not a number")
  end
    it '配送料の負担の情報がなければ出品できない' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge is not a number")
    end

    it '配送先地域の情報がなければ出品できない' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area is not a number")
    end

    it '発送までの日数の情報がなければ出品できない' do
      @item.delivery_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day is not a number")
    end

    it '販売価格について情報がなけば出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '販売価格が¥300~¥9,999,9999の範囲でなければ出品できない' do
      @item.price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '販売価格は半角数字でなければ出品できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
  end
end
