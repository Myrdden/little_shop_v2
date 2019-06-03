class Coupon < ApplicationRecord
  belongs_to :user    

  validates :name, presence: true
  validates :amount, presence: true, numericality: {greater_than: 0}
end
