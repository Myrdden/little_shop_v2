class Coupon < ApplicationRecord
  belongs_to :user    
  has_many :order_items

  validates :name, presence: true
  validates :code, presence: true, length: (2..10)
  validates :amount, presence: true, numericality: {greater_than: 0}

  def used?
    return OrderItem.any? {|oi| oi.coupon ? oi.coupon.id == self.id : false}
  end
end
