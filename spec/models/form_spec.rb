require 'rails_helper'
RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    # binding.pry
    item = FactoryBot.create(:item)

    @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
    # @form = FactoryBot.build(:form)
  end

  describe '商品購入' do
    context '全ての項目に正しく記述されていれば購入できる' do
      it '全ての項目に正しく記述されていれば購入できる' do
        expect(@form).to be_valid
      end
      it 'address2が空でも購入できる' do
        expect(@form).to be_valid
      end
    end
    context '全ての項目に正しく記述されていなければ購入できない' do
      it 'tokenが空では購入できない' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
    it 'zip_codeが空では購入できない' do
      @form.zip_code = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Zip code can't be blank")
    end
    it 'cityが空では購入できない' do
      @form.city = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
    end
    it 'address1が空では購入できない' do
      @form.address1 = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Address1 can't be blank")
    end
    it 'telephoneが空では購入できない' do
      @form.telephone = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'areaが空では購入できない' do
      @form.area_id = ''
      @form.valid?
      expect(@form.errors.full_messages).to include("Area can't be blank")
    end
    it 'user_idが空では購入できない' do
      @form.user_id = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では購入できない' do
      @form.item_id = nil
      @form.valid?
      expect(@form.errors.full_messages).to include("Item can't be blank")
    end
    it 'area_idのカラムはid1では購入できない' do
      @form.area_id = '1'
      @form.valid?
      expect(@form.errors.full_messages).to include("Area can't be blank")
    end
    it 'zip_codeにハイフンが入っていなければ購入できない' do
      @form.zip_code = '1234567'
      @form.valid?
      expect(@form.errors.full_messages).to include('Zip code is invalid. Include hyphen(-)')
    end
    it 'telephoneは10桁以上11桁以下でなければ購入できない' do
      @form.telephone = '123456789012'
      @form.valid?
      expect(@form.errors.full_messages).to include('Telephone is invalid')
    end
    it 'telephoneは数字でなければ購入できない' do
      @form.telephone = 'あああああああああああ'
      @form.valid?
      expect(@form.errors.full_messages).to include('Telephone is invalid')
    end
    it 'telephoneは9桁では購入できない' do
      @form.telephone = '123456789'
      @form.valid?
      expect(@form.errors.full_messages).to include('Telephone is invalid')
    end
  end
end
