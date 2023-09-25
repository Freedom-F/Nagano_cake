class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  ## 小計を求めるメソッド
def subtotal
    price * amount
end
end
