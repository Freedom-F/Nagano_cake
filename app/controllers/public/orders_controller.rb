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
    if params[:order][:address_type] == "registered_address"
      @order.address = @address.address
      @order.post_code = @address.post_code
      @order.name = @address.name
    elsif params[:order][:address_type] =="customer_address"
      @order.address = current_customer.address
      @order.post_code = current_customer.post_code
      @order.name = current_customer.last_name+current_customer.first_name
    else
     @order.post_code = params[:order][:post_code]
     @order.address = params[:order][:address]
     @order.name = params[:order][:name]
    end
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
    @order_detail.price = cart_item.item.add_tax_excluded_price
    @order_detail.order_id =  @order.id
    @order_detail.save
  end
  current_customer.cart_items.destroy_all
  redirect_to orders_thanx_path
  end

  def index
    @orders = current_customer.orders.page(params[:page]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details= OrderDetail.where(order_id: @order.id)
  end


  private
  def order_params
  params.require(:order).permit(:payment_method,:post_code, :address, :name, :total_amount)
  end
end
