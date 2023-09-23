class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.post_code = @address.post_code
    @order.address = @address.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def thanx
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.price_including_tax = (cart_item.item.price_without_tax * 1.1).floor
      @order_detail.order_id =  @order.id
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
  end

  def show
  end


  private
  def order_params
  params.require(:order).permit(:payment_method,  :postal_code, :address, :name)
  end
end
