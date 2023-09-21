class Public::HomesController < ApplicationController

  def top
    render 'top'
    @items = Item.all
  end

  def about
    render 'about'
  end
end
