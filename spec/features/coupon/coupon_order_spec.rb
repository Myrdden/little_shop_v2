require 'rails_helper'

describe "Address-Order" do
  before :each do
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @user_adr = @user.addresses.create!(name: "TestAdr", address: "12345 Test St.", city: "Testtown", state: "CO", zip: "12345")

    @merchant1 = User.create!(name: "Merchant", email: "merch@nt1.com", active: true, role: 1, password: "password")
    @merchant2 = User.create!(name: "Merchant", email: "merch@nt2.com", active: true, role: 1, password: "password")

    @merchant1.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: true)
    @merchant2.coupons.create!(name: "Third", code: "CODE3", amount: 200, active: true, percent: false)

    @item1 = @merchant1.items.create!(name: "Item 1", active: true, price: 1.00, description: "Item 1 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)
    @item2 = @merchant2.items.create!(name: "Item 2", active: true, price: 2.00, description: "Item 2 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/items/#{@item1.id}"
    page.select '2', from: :quantity
    click_on "Add to Cart"
    visit "/items/#{@item2.id}"
    page.select '4', from: :quantity
    click_on "Add to Cart"
  end
  
  it "Shows correct total on index (percent)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE1"
      click_on "Add Coupon"
    end
    click_on "Check Out"

    expect(current_path).to eq("/profile/orders")
    expect(page).to have_content("Order Cost: $9.00")
  end

  it "Shows correct total on index (dollars)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE3"
      click_on "Add Coupon"
    end
    click_on "Check Out"

    expect(current_path).to eq("/profile/orders")
    expect(page).to have_content("Order Cost: $8.00")
  end

  it "Shows correct total on show (percent)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE1"
      click_on "Add Coupon"
    end
    click_on "Check Out"
    click_on "Order"

    expect(page).to have_content("Total Cost: $9.00")
  end

  it "Shows correct total on show (dollar)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE3"
      click_on "Add Coupon"
    end
    click_on "Check Out"
    click_on "Order"

    expect(page).to have_content("Total Cost: $8.00")
  end
end
