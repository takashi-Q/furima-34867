require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品の登録が出来るとき' do
    context '商品の登録が出来るとき' do
      it '全ての項目が正しければ登録できること' do
        expect(@item).to be_valid
      end
    end

  context '商品が登録出来ないとき' do

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'product_nameが空では登録できないこと' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it 'status_idが空では登録できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it 'area_idが空では登録できないこと' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end

    it 'days_ship_idが空では登録できないこと' do
      @item.days_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days ship must be other than 1")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは¥299以下は保存不可であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end

    it 'priceは¥10000000以上は保存不可であること' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

    it 'priceはアルファベットは保存不可であること' do
      @item.price = 'q'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  
    it 'priceは半角は保存不可であること' do
      @item.price = 'ァ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

  end
  end
  end
