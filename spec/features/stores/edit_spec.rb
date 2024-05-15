require "rails_helper"

describe "Store Edit Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
  end

  describe "Store Update" do
    it "has a header" do
      visit("/stores/#{@store_1.id}/edit")

      expect(page).to have_content("Update #{@store_1.name}")
    end

    it "displays a form to edit store" do
      visit("/stores/#{@store_1.id}/edit")

      expect(page).to have_selector("form")
    end

    it "directs to the store show page when Update Store Name button is clicked" do
      visit("/stores/#{@store_1.id}/edit")

      fill_in(:name, with: "Ultimate Vibes")
      check(:ongoing_sale)
      fill_in(:annual_revenue, with: 200000)

      click_button("Update #{@store_1.name}")

      expect(current_path).to eq("/stores/#{@store_1.id}")
    end

    it "updates the store show page with the updated store" do
      visit("/stores/#{@store_1.id}/edit")

      fill_in(:name, with: "Ultimate Vibes")
      check(:ongoing_sale)
      fill_in(:annual_revenue, with: 200000)

      click_button("Update #{@store_1.name}")

      expect(current_path).to eq("/stores/#{@store_1.id}")

      expect(page).to have_content("Name: Ultimate Vibes")
      expect(page).to have_content("Annual Revenue: $200,000")

      expect(page).to_not have_content("Name: Guitar Center")
      expect(page).to_not have_content("Annual Revenue: $100,000")
    end
  end
end