require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての情報が存在すれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?

      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに@がないと登録できないこと' do
      @user.email = 'kskskksksk'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailが重複した場合は登録できな' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが6文字以上でなければ登録できない' do
      @user.password = '111aa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが英字のみでは登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが半角英数混合でなければ登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '111111k'
      @user.password_confirmation = '111111kk'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '名前がなければ登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '名字がなければ登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'kakakaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '名字は、全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'kakakaka'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前(カタカナ)がなければ登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '名字(カタカナ)がなければ登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '名前は、カタカナでなければ登録できない' do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '名字は、カタカナでなければ登録できない' do
      @user.last_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '生年月日の記述がなければ登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
