class AddOrderItemToCoupon < ActiveRecord::Migration[5.1]
  def change
    add_reference :order_items, :coupon, foreign_key: true
  end
end
