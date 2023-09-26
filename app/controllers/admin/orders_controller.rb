class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    
    if @order.update(order_params)
      
      if @order.status == "payment_confirm"
        OrderDetail.where(order_id: @order.id).update_all(making_status: "wait_production")
      end
      
      redirect_to admin_order_path, notice: "注文ステータスを更新しました。"
    else
      flash.now[:danger] = "予期せぬエラーが発生しました"
      @order_details = @order.order_details
      render 'show'
    end
  end
  
  def order_params
    params.require(:order).permit(:status)
  end
end
