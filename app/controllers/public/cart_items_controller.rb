class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.sum { |cart_item| cart_item.subtotal }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_items = CartItem.new(cart_items_params)
    @cart_items.save
      redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
