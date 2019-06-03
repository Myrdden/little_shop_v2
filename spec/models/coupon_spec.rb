require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should have_many(:order_items)}
  end

  describe "class methods" do
    it ".used?" do
      @dummy = User.create!(name: "asdf", email: "aa@aa.aa", role: 1, active: true, password: "asdf")
      @c1 = @dummy.coupons.create!(name: "1", code: "HECKA", amount: 50, percent: true)
      @c2 = @dummy.coupons.create!(name: "2", code: "HECKA", amount: 50, percent: true)

      @item = create(:item, user: @dummy)

      @order = create(:packaged, user: @dummy, status: 0)
      @order_item = create(:order_item, order: @order, item: @item, coupon: @c2)

      expect(@c1.used?).to eq(false)
      expect(@c2.used?).to eq(true)
    end
  end
end
