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
  
  it "Index shows address" do
    visit "/profile/orders"

    within "#Order-#{@o1.id}" do
      expect(page).to have_content("Shipping Address: #{@user_adr.address}, #{@user_adr.city} #{@user_adr.state} #{@user_adr.zip} (#{@user_adr.name})")
    end
  end

  it "Order show has address stuff (pending)" do
    visit "/profile/orders/#{@o1.id}"

    expect(page).to have_content("Shipping To: #{@user_adr.address}, #{@user_adr.city} #{@user_adr.state} #{@user_adr.zip} (#{@user_adr.name})")
    expect(page).to have_css("#address-select")
  end

  it "Order doesn't have that stuff if not pending" do
    visit "/profile/orders/#{@o3.id}"

    expect(page).to have_content("Shipping To: #{@user_adr.address}, #{@user_adr.city} #{@user_adr.state} #{@user_adr.zip} (#{@user_adr.name})")
    expect(page).to_not have_css("#address-select")
  end

  it "Can change address on pending order" do
    @other = @user.addresses.create!(name: "Other", address: "54321 Different Place", city: "Othertown", state: "OK", zip: "99999")
    visit "/profile/orders/#{@o1.id}"

    select("Other", from: "address_name")
    click_on("Change Address")

    expect(current_path).to eq("/profile/orders/#{@o1.id}")
    expect(page).to have_content("Shipping To: #{@other.address}, #{@other.city} #{@other.state} #{@other.zip} (#{@other.name})")
  end
end
