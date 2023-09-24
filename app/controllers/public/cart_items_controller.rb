class Public::CartItemsController < ApplicationController

  def index
     @cart_items = current_customer.cart_items
     @items = @cart_items.map(&:item)
     @total_price = @cart_items.sum(&:subtotal)
  end

  def update
    @cart_item = CartItem.find(params[:id])
    new_quantity = params[:cart_item][:amount].to_i
    @cart_item.update(amount: new_quantity)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path, notice: '商品がカートから削除されました。'
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path, notice: 'カート内の商品をすべて削除しました。'
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = params[:cart_item][:item_id]
    @cart_item.amount = params[:cart_item][:amount].to_i
    @cart_item.save
      redirect_to cart_items_path
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end