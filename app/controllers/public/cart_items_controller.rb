class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items
    #@total_price = @cart_items.sum { |cart_item| cart_item.subtotal }
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:cart_item][:item_id]
    @cart_item.save
      redirect_to public_cart_items_index_path
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
