class ItemsController < ApplicationController
  def index
 end

  def create
    
    @Items = Item.find(params[:id]) 
    
  end
end
