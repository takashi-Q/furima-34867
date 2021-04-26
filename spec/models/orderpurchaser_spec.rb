require 'rails_helper'

RSpec.describe Orderpurchaser, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:orderpurchaser, user_id: user.id, item_id: item.id)
      sleep 1
    end

    describe '商品の購入が出来るとき' do
      context '商品の購入が出来るとき' do
        it '全ての項目が正しければ購入できること' do
          expect(@order).to be_valid
        end

        it '電話番号は11桁以内の数値のみできること' do
          @order.telephone = '11111111'
          expect(@order).to be_valid
        end

        it '建物名は無くても良い' do
          @order.building_name = nil
          expect(@order).to be_valid
        end
      end
    end
    context '商品が購入出来ないとき' do
      it '郵便番号が空では保存できないこと' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にはー(ハイフン)が無ければ保存できないこと' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県は１を選択出来ない' do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include('Area must be other than 1')
      end

      it '市区町村が空では保存できないこと' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order.adress = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Adress can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order.telephone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end

      it '電話番号は数字以外は保存出来ないこと' do
        @order.telephone = 'q'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid')
      end

      it '電話番号は12桁以上の数字は保存出来ないこと' do
        @order.telephone = '1111111111111'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid')
      end

      it 'クレジットカードが空では登録できないこと' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it '出品者が空では登録できないこと' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it '商品が空では登録できないこと' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
