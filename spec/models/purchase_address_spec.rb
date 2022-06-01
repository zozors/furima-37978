require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品が購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名がなくても登録できるできる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が出品できないとき' do
      
      it 'user_idが空だと登録できない' do
        @purchase_address.user_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと登録できない' do
        @purchase_address.item_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空だと登録できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeはハイフンなしでは登録できない' do
        @purchase_address.post_code = 'ooooooo'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idがnilだと登録できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1を選択されているとき' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと登録できない' do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_numberが空だと登録できない' do
        @purchase_address.telephone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberが9文字以下では登録できない' do
        @purchase_address.telephone_number = '000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12文字以上では登録できない' do
        @purchase_address.telephone_number = '000000000000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが全角では登録できない' do
        @purchase_address.telephone_number = '００００００００００'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

