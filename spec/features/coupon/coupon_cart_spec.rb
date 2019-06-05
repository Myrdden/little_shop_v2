require 'rails_helper'

describe "Address-Order" do
  before :each do
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @user_adr = @user.addresses.create!(name: "TestAdr", address: "12345 Test St.", city: "Testtown", state: "CO", zip: "12345")

    @merchant = User.create!(name: "Merchant", email: "merch@nt.com", active: true, role: 1, password: "password")
    @item = @merchant.items.create!(name: "Item 1", price: 1.00, description: "Item 1 Description",
                                    image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)

    @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: true)
    @merchant.coupons.create!(name: "Second", code: "CODE2", amount: 20, active: true, percent: false)
    @merchant.coupons.create!(name: "Third", code: "CODE3", amount: 200, active: true, percent: false)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    
    visit "/items/#{@item.id}"
    page.select '1', from: :quantity
    click_on "Add to Cart"
  end

  it "Can add a coupon code" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE1"
      click_on "Add Coupon"
    end

    expect(current_path).to eq('/cart')
    expect(page).to have_content("Coupon Applied: [CODE1] -> 50% off")
  end

  it "Calculates discounts correctly (percent)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE1"
      click_on "Add Coupon"
    end

    expect(page).to have_content("After Discounts: $0.50")
  end

  it "Calculates discounts correctly (dollar off)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE2"
      click_on "Add Coupon"
    end

    expect(page).to have_content("After Discounts: $0.80")
  end

  it "Doesn't go negative (dollar off)" do
    visit '/cart'

    within "#coupon-input" do
      expect(page).to have_content("Enter Coupon Code:")
      fill_in "code", with: "CODE3"
      click_on "Add Coupon"
    end

    expect(page).to have_content("After Discounts: $0.00")
  end
end
