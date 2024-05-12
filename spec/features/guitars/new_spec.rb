require "rails_helper"

describe "New Guitar Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)
  end

  describe "Creating a new Guitar" do
    it "has a header" do
      visit("/guitars/new")

      expect(page).to have_content("Create a New Guitar")
    end

    it "displays a form to create a new guitar" do
      visit("/guitars/new")

      expect(page).to have_selector("form")
    end

    it "can create new guitar" do
      visit("/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 550)

      click_button("Create Guitar")

      guitar_name = Guitar.last.name

      expect(guitar_name).to eq("Schecter Omen")
    end

    it "redirects to guitars index page when button is clicked" do
      visit("/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 550)

      click_button("Create Guitar")

      expec(current_path).to eq("/guitars")
    end

    it "displays the new guitar on the index page" do
      visit("/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 550)

      click_button("Create Guitar")

      expect(page).to have_content("Schecter Omen")
    end
  end
end