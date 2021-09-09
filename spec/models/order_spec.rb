require 'rails_helper'

RSpec.describe , type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '全ての項目に正しく記述されていれば登録できる' do
      it '全ての項目に正しく記述されていれば登録できる' do
        expect(@order).to be_valid
      end
    end
  end  
end
