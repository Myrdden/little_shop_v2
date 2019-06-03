class Coupon < ApplicationRecord
  belongs_to :user    
  has_many :coupon_orders
  has_many :orders, through: :coupon_orders

  validates :name, presence: true
  validates :code, presence: true, length: (2..10)
  validates :amount, presence: true, numericality: {greater_than: 0}

  def used?
    return CouponOrder.any? {|oi| oi.coupon_id == self.id}
  end
end
