class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    
    if order_detail.update(order_detail_params)
      
      if order_detail.making_status == "production"
        Order.where(id: order_detail.order.id).update(status: "production")
      elsif OrderDetail.where(order_id: order_detail.order.id).and(OrderDetail.where.not(making_status: "completed")).count == 0
        Order.where(id: order_detail.order.id).update(status: "prepare_shipping")
      end
      
      redirect_to admin_order_path(order_detail.order), notice: "製作ステータスを更新しました。"
    else
      flash[:danger] = "予期せぬエラーが発生しました"
      redirect_to admin_order_path(order_detail.order)
    end
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
