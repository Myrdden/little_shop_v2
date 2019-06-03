class AddOrderItemToCoupon < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupons, :order_items, foreign_key: true
  end
end
