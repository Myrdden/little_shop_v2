require 'rails_helper'
describe "as a merchant" do
  describe "when I visit my dashboard page" do
    before :each do
      @merchant = create(:merchant, email: "m1@gmail.com")
      @itemA = @merchant.items.create!(name: "Item 1", price: 1.00, description: "Item 1 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 10)
      @itemB = @merchant.items.create!(name: "Item 2", price: 2.00, description: "Item 2 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 11)
      @itemC = @merchant.items.create!(name: "Item 3", price: 2.50, description: "Item 3 Description", image: "https://tradersofafrica.com/img/no-product-photo.jpg", inventory: 12)
      @user1 = create(:user, email: "u1@gmail.com")
    end

    it "shows all the stuff it should" do
      visit root_path

      click_link "LogIn"
      fill_in 'email', with: @merchant.email
      fill_in 'password', with: @merchant.password
      click_button "Log In"

      click_link "Dashboard"
      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content(@merchant.name)
      expect(page).to have_content(@merchant.email)
      expect(page).to have_content(@merchant.address)
      expect(page).to have_content(@merchant.city)
      expect(page).to have_content(@merchant.state)

      within "#item-#{@itemA.id}" do
        expect(page).to have_content(@itemA.name)
        expect(page).to have_content(@itemA.inventory)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Disable")
      end
      within "#item-#{@itemB.id}" do
        expect(page).to have_content(@itemB.name)
        expect(page).to have_content(@itemB.inventory)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Disable")
      end
      within "#item-#{@itemC.id}" do
        expect(page).to have_content(@itemC.name)
        expect(page).to have_content(@itemC.inventory)
        expect(page).to have_content("Edit")
        expect(page).to have_content("Disable")
      end
    end

    it "does not display for visitors or users" do
      visit root_path
      expect(page).to have_no_link("Dashboard")

      click_link "LogIn"
      fill_in 'email', with: @user1.email
      fill_in 'password', with: @user1.password
      click_button "Log In"

      visit root_path
      expect(page).to have_no_link("Dashboard")
    end
  end
end
