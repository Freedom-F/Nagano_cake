class Public::ItemsController < ApplicationController

  def index
    @item = Item.all
    @genres = Genre.all
    @items = params[:name].present? ? Genre.find(params[:name]).books : Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end



