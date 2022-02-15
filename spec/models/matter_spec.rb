require 'rails_helper'

RSpec.describe Matter, type: :model do
  before do
    @matter = FactoryBot.build(:matter)
  end

  describe '案件投稿機能' do
    context '案件投稿ができる場合' do
      it '全ての項目が存在するとき' do
        expect(@matter).to be_valid
      end
    end

    context '案件投稿ができない場合' do
      it '画像が空では登録できない' do
        @matter.image = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Image can't be blank")
      end

      it 'タイトルが空では登録できない' do
        @matter.title = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Title can't be blank")
      end

      it '案件内容が空では登録できない' do
        @matter.info = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Info can't be blank")
      end

      it 'ジャンルが空では登録できない' do
        @matter.genre_id = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Genre can't be blank")
      end

      it 'ジャンルの選択項目が(--)では登録できない' do
        @matter.genre_id = '1'
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Genre can't be blank")
      end

      it '稼働日数・時間が空では登録できない' do
        @matter.scheduled_id = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Scheduled can't be blank")
      end

      it '稼働日数・時間の選択項目が(--)では登録できない' do
        @matter.scheduled_id = '1'
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Scheduled can't be blank")
      end

      it '案件の特徴・場所が空では登録できない' do
        @matter.detail = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Detail can't be blank")
      end

      it '時給が空では登録できない' do
        @matter.price = ''
        @matter.valid?
        expect(@matter.errors.full_messages).to include("Price can't be blank")
      end

      it '半角数値でないと登録できない' do
        @matter.price = '１２３４'
        @matter.valid?
        expect(@matter.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end

      it '価格は999円以下では登録できない' do
        @matter.price = '123'
        @matter.valid?
        expect(@matter.errors.full_messages).to include('Price is out of setting range')
      end

      it '価格は100000円以上では登録できない' do
        @matter.price = '110000'
        @matter.valid?
        expect(@matter.errors.full_messages).to include('Price is out of setting range')
      end

      it 'userが紐づいていないと登録できない' do
        @matter.user = nil
        @matter.valid?
        expect(@matter.errors.full_messages).to include('User must exist')
      end
    end
  end
end
