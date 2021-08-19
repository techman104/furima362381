class ItemsController < ApplicationController   
  def index
    @items = Item.all
   end
  
   def new
    @Item = Item.new
  end 
  
  def create
    Tweet.create(tweet_params)
  end
  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text)
  end
end
