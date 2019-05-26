
# I see all merchants in the system
# Next to each merchant's name I see their city and state
# The merchant's name is a link to their Merchant Dashboard at routes such as "/admin/merchants/5"
# I see a "disable" button next to any merchants who are not yet disabled
# I see an "enable" button next to any merchants whose accounts are disabled

require 'rails_helper'

describe "as an admin" do
  describe "when I visit the merchant index page at '/merchants'" do
    before :each do
      @admin_1 = User.create!(email: "admin_1@gmail.com", role: 2, name: "Admin 1", address: "Admin 1 Address", city: "Admin 1 City", state: "Admin 1 State", zip: "12345", password: "123456")

      @merchant_1 = User.create!(email: "merchant_1@gmail.com", role: 1, name: "Merchant 1", address: "Merchant 1 Address", city: "Merchant 1 City", state: "Merchant 1 State", zip: "32345", password: "123456", active: true)
      @merchant_2 = User.create!(email: "merchant_2@gmail.com", role: 1, name: "Merchant 2", address: "Merchant 2 Address", city: "Merchant 2 City", state: "Merchant 2 State", zip: "42345", password: "123456", active: false)

      visit root_path

      click_on "LogIn"
      fill_in "email", with: @admin_1.email
      fill_in "password", with: @admin_1.password
      click_on "Log In"
    end

    it "it displays all merchants" do
      visit merchants_path
      within "#merchant-#{@merchant_1.id}" do
        expect(page).to have_link(@merchant_1.name)
        expect(page).to have_content(@merchant_1.city)
        expect(page).to have_content(@merchant_1.state)
        expect(page).to have_button("disable")
      end
      within "#merchant-#{@merchant_2.id}" do
        expect(page).to have_link(@merchant_2.name)
        expect(page).to have_content(@merchant_2.city)
        expect(page).to have_content(@merchant_2.state)
        expect(page).to have_button("enable")
      end

    end

    it "lets an admin know if a merchant was enabled/disabled" do
      visit merchants_path
      within "#merchant-#{@merchant_2.id}" do
        click_button "enable"
      end
        expect(current_path).to eq(merchants_path)
        expect(page).to have_content("Merchant #{@merchant_2.id} enabled")
        @merchant_2.reload
        expect(@merchant_2.active).to eq(true)
        within "#merchant-#{@merchant_2.id}" do
          click_button "disable"
        end
        expect(current_path).to eq(merchants_path)
        expect(page).to have_content("Merchant #{@merchant_2.id} disabled")
        expect(User.find(@merchant_2.id).active).to eq(false)
    end

    it "only lets enabled users log in" do
      click_on "Logout"
      click_on "LogIn"
      fill_in "email", with: @merchant_1.email
      fill_in "password", with: @merchant_1.password
      click_on "Log In"
      expect(current_path).to eq(dashboard_path(@merchant_1))
      click_on "Logout"
      click_on "LogIn"
      fill_in "email", with: @merchant_2.email
      fill_in "password", with: @merchant_2.password
      click_on "Log In"
      expect(current_path).to eq(login_path)

    end

  end

end
