require "rails_helper"

describe "Store Guitars New Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)
  end

  describe "Store's Guitar Creation" do
    it "displays a form to create a new guitar for current store" do
      visit("/stores/#{@store_1.id}/guitars/new")

      expect(page).to have_selector("form")
    end

    it "creates a new guitar when form is filled out" do
      visit("/stores/#{@store_1.id}/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 600)

      click_button("Create Guitar for #{@store_1.name}")

      guitar_name = Guitar.last.name
      guitar_price = Guitar.last.price

      expect(guitar_name).to eq("Schecter Omen")
      expect(guitar_price).to eq(600)
    end

    it "creates a guitar and that guitar belongs to the specified store" do
      visit("/stores/#{@store_1.id}/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 600)

      click_button("Create Guitar for #{@store_1.name}")

      new_guitar = Guitar.last

      expect(new_guitar.store_id).to eq(@store_1.id)
    end

    it "redirects to the store's guitars index page when button is clicked" do
      visit("/stores/#{@store_1.id}/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 600)

      click_button("Create Guitar for #{@store_1.name}")

      expect(current_path).to eq("/stores/#{@store_1.id}/guitars")
    end

    it "displays the new guitar on the store's guitars index page" do
      visit("/stores/#{@store_1.id}/guitars/new")

      fill_in(:name, with: "Schecter Omen")
      check(:used)
      fill_in(:price, with: 600)

      click_button("Create Guitar for #{@store_1.name}")

      expect(current_path).to eq("/stores/#{@store_1.id}/guitars")

      expect(page).to have_content("Name: Schecter Omen")
      expect(page).to have_content("Price: $600")
    end
  end
end