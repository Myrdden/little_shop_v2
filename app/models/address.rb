class Address < ApplicationRecord
  belongs_to :user  

  validates :name, presence: true #, uniqueness: true --How do?
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true

  def used?
    return Order.any? {|order| order.status != 0 && order.address_id == self.id}   
  end
end
