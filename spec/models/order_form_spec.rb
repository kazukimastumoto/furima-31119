require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

      it '郵便番号がなければ購入できない' do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @order_form.postal_code = "1111111"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県の情報がないと購入できない' do
        @order_form.prefectures_id = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefectures is not a number")
      end

      it '都道府県の情報1では購入できない' do
        @order_form.prefectures_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefectures must be other than 1")
      end

      it '市町村区の情報がないと購入できないこと' do
      @order_form.city = ""
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地の情報がないと購入できないこと' do
        @order_form.address = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと購入できないこと' do
        @order_form.cellphone_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Cellphone number can't be blank")
      end

      it '電話番番号にハイフンがあり、かつ11桁以上だと購入できないこと' do
        @order_form.cellphone_number = "080-5111-5111"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Cellphone number is invalid")
      end

      it 'tokenが空だと購入できないこと' do
        @order_form.token = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it '全ての情報があれば購入できること' do
        expect(@order_form).to be_valid
      end
  end
end
