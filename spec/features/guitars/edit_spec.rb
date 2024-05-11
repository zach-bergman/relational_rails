require "rails_helper"

describe "Guitar Edit Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
  end

  describe "Guitar Update" do
    it "has a header" do
      visit("/guitars/#{@guitar_1.id}/edit")

      expect(page).to have_content("Update #{@guitar_1.name}")
    end

    it "displays a form to edit guitar" do
      visit("/guitars/#{@guitar_1.id}/edit")

      expect(page).to have_selector("form")
    end

    it "redirects to the guitar show page when Update Guitar Name button is clicked" do
      visit("/guitars/#{@guitar_1.id}/edit")

      fill_in(:name, with: "Epiphone ES-333")
      check(:used)
      fill_in(:price, with: 450)

      click_button("Update #{@guitar_1.name}")

      expect(current_path).to eq("/guitars/#{@guitar_1.id}")
    end

    it "updates the guitar show page with the updated guitar" do
      visit("/guitars/#{@guitar_1.id}/edit")

      fill_in(:name, with: "Epiphone ES-333")
      check(:used)
      fill_in(:price, with: 450)

      click_button("Update #{@guitar_1.name}")

      expect(current_path).to eq("/guitars/#{@guitar_1.id}")

      expect(page).to have_content("Name: Epiphone ES-333")
      expect(page).to have_content("Price: $450")

      expect(page).to_not have_content("Name: Fender Stratocaster")
      expect(page).to_not have_content("Price: $680")
    end
  end
end