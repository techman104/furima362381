class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new]
  
  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
  end
  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(order_params)
    if @form.valid?
      pay_item
      Payjp.api_key = "sk_test_1f123e9ff90b037af5f44780"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:zip_code, :area_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end
  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
  
  # 削除
  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end
end
