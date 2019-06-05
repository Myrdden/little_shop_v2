require 'rails_helper'

describe "Coupon CRUD" do
  before :each do
    @merchant = User.create!(name: "Merchant", email: "merch@nt.com", active: true , role: 1, password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant)
  end

  it "Displays Properly" do
    @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: true)
    @merchant.coupons.create!(name: "Second", code: "CODE2", amount: 50, active: true, percent: false)

    visit '/dashboard'

    expect(page).to have_content("First: [CODE1] -> 50% off")
    expect(page).to have_content("Second: [CODE2] -> $0.50 off")
  end

  it "Create" do
    visit '/dashboard'

    click_on "Add Coupon"
    expect(current_path).to eq("/coupons/new")
    fill_in "coupon[name]", with: "New"
    fill_in "coupon[code]", with: "CODE"
    fill_in "coupon[amount]", with: "5000"
    click_on "Add Coupon"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("New: [CODE] -> $50.00 off")
  end

  it "Sad Create" do
    @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: true)
    visit '/dashboard'

    click_on "Add Coupon"    
    expect(current_path).to eq("/coupons/new")
    fill_in "coupon[name]", with: "New"
    fill_in "coupon[code]", with: "CODE1"
    fill_in "coupon[amount]", with: "5000"
    click_on "Add Coupon"

    expect(current_path).to eq("/coupons/new")
    expect(page).to have_content("Invalid input.")
  end

  it "Update" do
    @coupon = @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: false)
    visit '/dashboard'

    within "#coupon-#{@coupon.id}" do
      click_on "Edit"
    end
    expect(current_path).to eq("/coupons/#{@coupon.id}/edit")
    fill_in "coupon[amount]", with: "250"
    click_on "Update Coupon"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("First: [CODE1] -> $2.50 off")
  end

  it "Update Badly" do
    @coupon = @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: false)
    visit '/dashboard'

    within "#coupon-#{@coupon.id}" do
      click_on "Edit"
    end
    expect(current_path).to eq("/coupons/#{@coupon.id}/edit")
    fill_in "coupon[amount]", with: "eeeeeee"
    click_on "Update Coupon"

    expect(current_path).to eq("/coupons/#{@coupon.id}/edit")
    expect(page).to have_content("Invalid input.")
  end

  it "Unused Delete" do
    @coupon = @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: false)
    visit '/dashboard'

    within "#coupon-#{@coupon.id}" do
      expect(page).to have_content("Edit")
      expect(page).to have_content("Delete")
      expect(page).to_not have_content("Disable")
      click_on "Delete"
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Coupon has been deleted.")
    expect(page).to_not have_css("#coupon-#{@coupon.id}")
  end

  it "Used Disable" do
    @coupon = @merchant.coupons.create!(name: "First", code: "CODE1", amount: 50, active: true, percent: false)
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @order = create(:packaged, user: @user, status: 2)
    @item = @merchant.items.create!(name: "Item 1", active: true, price: 1.00, description: "Item 1 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)
    @order_item = @order.order_items.create!(item_id: @item.id, quantity: 1, price: 1.00, fulfilled: true, coupon: @coupon)

    visit '/dashboard'

    within "#coupon-#{@coupon.id}" do
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
      expect(page).to have_content("Disable")
      click_on "Disable"
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Coupon has been disabled.")
    expect(page).to_not have_css("#coupon-#{@coupon.id}")
  end
end
