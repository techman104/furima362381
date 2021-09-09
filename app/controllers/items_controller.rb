class ItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit]
  before_action :set_item, only: %i[edit show update destroy]
  # before_action :move_to_index, only: [:edit, :update]
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show; end

  def edit
    
    redirect_to root_path if user_signed_in? && current_user.id != @item.user.id || @item.order.present?
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path if @item.destroy
    redirect_to root_path if user_signed_in? && current_user.id != @item.user.id
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :category_id, :area_id, :delivery_id, :status_id, :day_id, :image,
                                 :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
