class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    # byebug
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to admin_order_path
    else
      byebug
    end
  end
  
  def order_params
    params.require(:order).permit(:status)
  end
end
