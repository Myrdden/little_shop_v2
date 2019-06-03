class CreateCouponOrder < ActiveRecord::Migration[5.1]
  def change
    create_table :coupon_orders do |t|
      t.references :coupon, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
