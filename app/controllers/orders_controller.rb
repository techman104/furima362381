class OrdersController < ApplicationController
  def index
    @form = Form.new
  end
  def create
    @form = Form.new(order_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:zip_code, :area_id, :city, :address1, :address2, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # 削除
  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end
end
