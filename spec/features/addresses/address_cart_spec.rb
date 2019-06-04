require 'rails_helper'

describe "Address-Cart" do
  before :each do
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @user_address = @user.addresses.new(name: "TestAdr", address: "12345 Test St.", city: "Testtown", state: "CO", zip: "12345")

    @merchant = User.create!(name: "Merchant", email: "merch@nt.com", active: true, role: 1, password: "password")
    @item = @merchant.items.create!(name: "Item 1", price: 1.00, description: "Item 1 Description",
                                    image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/items/#{@item.id}"
    page.select '1', from: :quantity
    click_on "Add to Cart"
  end
  
  it "Tells you when there's no addresses" do
    visit '/cart'

    expect(page).to_not have_css('#address-select')
    expect(page).to_not have_content(@user_address.name)
    expect(page).to have_content("You have no stored addresses. Add one to check out.")
  end

  it "Sees addresses in cart" do
    @user_address.save

    visit '/cart'

    within '#address-select' do
      expect(page).to have_content(@user_address.name)
    end
  end
  
  it "Can place an order with an address" do
    @user_address.save
    @other = @user.addresses.create!(name: "Other", address: "54321 Different Place", city: "Othertown", state: "OK", zip: "99999")

    visit '/cart'

    within '#address-select' do
      select 'Other', from: "address_name"
    end
    click_on "Check Out"
    
    expect(current_path).to eq('/profile/orders')
    expect(page).to have_content("Shipping Address: #{@other.address}, #{@other.city} #{@other.state} #{@other.zip} (#{@other.name})")
  end
end
