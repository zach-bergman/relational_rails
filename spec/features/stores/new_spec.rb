require "rails_helper"

describe "New Store Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @store_3 = Store.create!(name: "Happy Strings", ongoing_sale: true, annual_revenue: 50000)
  end

  describe "New Store Form" do
    it "displays a form for creating a new store" do
      visit("/stores/new")

      expect(page).to have_selector("form")
    end

    it "can create a new store" do
      visit("/stores/new")

      fill_in(:name, with: "Sweetwater")
      check(:ongoing_sale)
      fill_in(:annual_revenue, with: 110000)

      click_button("Create Store")

      new_store_name = Store.last.name

      expect(new_store_name).to eq("Sweetwater")
    end

    it "redirects to Stores index page when Create Store button in clicked" do
      visit("/stores/new")

      fill_in(:name, with: "Sweetwater")
      check(:ongoing_sale)
      fill_in(:annual_revenue, with: 110000)

      click_button("Create Store")

      expect(current_path).to eq("/stores")
    end

    it "displays the new Store on the index page" do
      visit("/stores/new")

      fill_in(:name, with: "Sweetwater")
      check(:ongoing_sale)
      fill_in(:annual_revenue, with: 110000)

      click_button("Create Store")

      expect(page).to have_content("Sweetwater")
    end
  end
end