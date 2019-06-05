class Address < ApplicationRecord
  belongs_to :user  

  validates :name, presence: true #, uniqueness: true --How do?
  validates :address, :city, :state, :zip, presence: true

  def used?
    return Order.any? {|order| order.status != "pending" && order.address_id == self.id}   
  end
end
