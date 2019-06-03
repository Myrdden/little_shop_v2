require 'rails_helper'

describe "Address CRUD" do
  before :each do
    @user = User.create!(name: "Test User", email: "test@user.com", active: true , role: 0, password: "password")
    @user_address = @user.addresses.create!(name: "Home", address: "12345 Test St.", city: "Testtown", state: "CO", zip: "12345")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "Create" do
    visit '/profile'
    click_link "Add Address"

    expect(current_path).to eq('/addresses/new')
    fill_in "address[name]", with: "New"
    fill_in "address[address]", with: "246810 Testing Rd."
    fill_in "address[city]", with: "Test City"
    select("CA", from: "address[state]")
    fill_in "address[zip]", with: "54321"
    click_on "Add Address"

    expect(current_path).to eq('/profile')
    expected_address = "New: 246810 Testing Rd. Test City, CA 54321"
    expect(page).to have_content(expected_address)
  end

  it "Update" do
    visit '/profile'
    within "#address-#{@user_address.id}" do
      click_link "Edit"
    end

    expect(current_path).to eq("/addresses/#{@user_address.id}/edit")
    fill_in "address[address]", with: "11111 Test Rd."
    click_on "Update Address"

    expect(current_path).to eq('/profile')
    expected_address = "Home: 11111 Test Rd. Testtown, CO 12345"
    expect(page).to have_content(expected_address)
  end

  it "Delete (if unused)" do
    visit '/profile'
    within "#address-#{@user_address.id}" do
      click_link "Delete"
    end

    expect(current_path).to eq('/profile')
    expected_address = "Home: 12345 Test St. Testtown, CO 12345"
    expect(page).to_not have_content(expected_address)
  end

  it "Disable (if used)" do
    create(:packaged, user: @user, address_id: @user_address.id, status: 2)

    visit '/profile'
    within "#address-#{@user_address.id}" do
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
      expect(page).to have_content("Disable")
      click_link "Disable"
    end

    expect(current_path).to eq('/profile')
    expected_address = "Home: 12345 Test St. Testtown, CO 12345"
    expect(page).to_not have_content(expected_address)
  end
end
