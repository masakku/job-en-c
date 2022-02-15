require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it '全ての項目が存在すれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができない時' do
      it 'nicknameが空だと保存ができない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'name_kanaが空だと保存できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end

      it 'name_kanaが半角文字だと保存できない' do
        @user.name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana 全角カタカナを使用してください')
      end

      it 'name_kanaが全角ひらがなだと保存できない' do
        @user.name_kana = 'やまだたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana 全角カタカナを使用してください')
      end

      it 'name_kanaが数字が混合してると保存できない' do
        @user.name_kana = 'ヤマダ1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana 全角カタカナを使用してください')
      end

      it 'name_kanaが漢字が混合してると保存できない' do
        @user.name_kana = '山田太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana 全角カタカナを使用してください')
      end

      it 'emailが空だと保存できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emaiに@がないと保存できない' do
        @user.email = 'furimagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは全角文字では保存できない' do
        @user.password = 'やまだたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字と数字の両方を含めて設定してください')
      end

      it 'passwordは5文字以下では保存できない' do
        @user.password = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordは数字のみでは保存できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字と数字の両方を含めて設定してください')
      end

      it 'passwordは英字のみでは保存できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には半角英字と数字の両方を含めて設定してください')
      end

      it 'profileが空では保存できない' do
        @user.profile = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Profile can't be blank")
      end

      it 'occupationが空では保存できない' do
        @user.occupation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Occupation can't be blank")
      end

      it 'occupationが半角文字だと保存できない' do
        @user.occupation = 'programmer'
        @user.valid?
        expect(@user.errors.full_messages).to include('Occupation 全角文字を使用してください')
      end
    end
  end
end
