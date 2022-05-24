require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context '商品が出品できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'ユーザーが紐づいていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'titleが空だと登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空だと登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'categoryが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'situationが空だと登録できない' do
        @item.situation_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it 'burden_of_shipping_chargeが空だと登録できない' do
        @item.burden_of_shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden of shipping charge can't be blank")
      end
      it 'prefectureが空だと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_dayが空だと登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が￥300より少ない時は登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '販売価格が￥9999999より多い時は登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが全角だと登録できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
