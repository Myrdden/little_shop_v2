require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe "relationships" do
    it {should belong_to :user}
    it {should have_many(:orders).through(:coupon_orders)}
  end

  describe "class methods" do
    it ".used?" do
      @dummy = User.create!(name: "asdf", email: "aa@aa.aa", role: 1, active: true, password: "asdf")
      @c1 = @dummy.coupons.create!(name: "1", code: "HECKA", amount: 50, percent: true)
      @c2 = @dummy.coupons.create!(name: "2", code: "HECKA", amount: 50, percent: true)
      @c3 = @dummy.coupons.create!(name: "3", code: "HECKA", amount: 50, percent: true)
      @c4 = @dummy.coupons.create!(name: "4", code: "HECKA", amount: 50, percent: true)

      @o1 = create(:packaged, user: @dummy, coupon_id: @a1.id, status: 0)
      @o2 = create(:packaged, user: @dummy, coupon_id: @a2.id, status: 1)
      @o3 = create(:packaged, user: @dummy, coupon_id: @a3.id, status: 2)
      @o4 = create(:packaged, user: @dummy, coupon_id: @a4.id, status: 3)

      expect(@a1.used?).to eq(false)
      expect(@a2.used?).to eq(true)
      expect(@a3.used?).to eq(true)
      expect(@a4.used?).to eq(true)
    end
  end
end
