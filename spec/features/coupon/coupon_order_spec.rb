require 'rails_helper'

describe "Address-Order" do
  before :each do
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @user_adr = @user.addresses.create!(name: "TestAdr", address: "12345 Test St.", city: "Testtown", state: "CO", zip: "12345")

    @merchant = User.create!(name: "Merchant", email: "merch@nt.com", active: true, role: 1, password: "password")
    @item = @merchant.items.create!(name: "Item 1", price: 1.00, description: "Item 1 Description",
                                    image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    @o1 = create(:packaged, user: @user, address_id: @user_adr.id, status: 0)
    @o2 = create(:packaged, user: @user, address_id: @user_adr.id, status: 1)
    @o3 = create(:packaged, user: @user, address_id: @user_adr.id, status: 2)
    @o4 = create(:packaged, user: @user, address_id: @user_adr.id, status: 3)
  end
end
