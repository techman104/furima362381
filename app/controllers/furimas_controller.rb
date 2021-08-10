class FurimasController < ApplicationController
  def index
    @furimas = furimas.all
  end  
end
