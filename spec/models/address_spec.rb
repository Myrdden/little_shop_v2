require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "relationships" do
    it {should belong_to :user}
  end

  describe "class methods" do
    it ".used?" do
      @dummy = User.create!(name: "asdf", email: "aa@aa.aa", role: 0, active: true, password: "asdf")
      @a1 = @dummy.addresses.create!(name: "a1", address: "123", city: "asdf", state: "CA", zip: "12345")
      @a2 = @dummy.addresses.create!(name: "a2", address: "124", city: "asdf", state: "CA", zip: "12345")
      @a3 = @dummy.addresses.create!(name: "a3", address: "125", city: "asdf", state: "CA", zip: "12345")
      @a4 = @dummy.addresses.create!(name: "a4", address: "126", city: "asdf", state: "CA", zip: "12345")

      @o1 = create(:packaged, user: @dummy, address_id: @a1.id, status: 0)
      @o2 = create(:packaged, user: @dummy, address_id: @a2.id, status: 1)
      @o3 = create(:packaged, user: @dummy, address_id: @a3.id, status: 2)
      @o4 = create(:packaged, user: @dummy, address_id: @a4.id, status: 3)

      expect(@a1.used?).to eq(false)
      expect(@a2.used?).to eq(true)
      expect(@a3.used?).to eq(true)
      expect(@a4.used?).to eq(true)
    end
  end
end
