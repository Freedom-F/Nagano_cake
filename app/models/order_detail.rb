class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { not_ready: 0, wait_production: 1, production: 2, completed: 3 }
  
  # 商品合計
  def self.item_total(order_details)
    total = 0
    
    order_details.each do |detail|
      total += detail.price * detail.amount
    end
    
    return total
  end

   ## 小計を求めるメソッド
  def subtotal
      price * amount
  end
end
