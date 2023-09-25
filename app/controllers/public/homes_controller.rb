class Public::HomesController < ApplicationController

  def top
    render 'top'
    @new_items = Item.new_arrivals
    @new_items = Item.where(is_new: true).order(created_at: :desc)
    @new_items = Item.order(created_at: :desc).limit(5)
  end

  def about
    render 'about'
  end
end
