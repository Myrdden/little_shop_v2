class Address < ApplicationRecord
  belongs_to :user  

  validates :name, presence: true #, uniqueness: true --How do?
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
end
