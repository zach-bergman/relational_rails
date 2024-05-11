require "rails_helper"

describe "Store Guitars Index Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)

    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @guitar_3 = @store_2.guitars.create!(name: "Epiphone Les Paul", used: false, price: 680)
    @guitar_4 = @store_2.guitars.create!(name: "Schecter Omen", used: true, price: 500)
  end

  describe "as a visitor" do
    describe "when I visit the store-guitars index page" do
      it "shows all of the guitars being sold by store 1" do
        visit("/stores/#{@store_1.id}/guitars")
        # save_and_open_page - launchy
        expect(page).to have_content("Name: #{@guitar_1.name}")
        expect(page).to have_content("Used?: #{@guitar_1.used}")
        expect(page).to have_content("Price: $#{@guitar_1.price}")

        expect(page).to have_content("Name: #{@guitar_2.name}")
        expect(page).to have_content("Used?: #{@guitar_2.used}")
        expect(page).to have_content("Price: $#{@guitar_2.price}")
      end
    end

    describe "when I visit the store-guitars index page" do
      it "shows all of the guitars being sold by store 2" do
        visit("/stores/#{@store_2.id}/guitars")

        expect(page).to have_content("Name: #{@guitar_3.name}")
        expect(page).to have_content("Used?: #{@guitar_3.used}")
        expect(page).to have_content("Price: $#{@guitar_3.price}")

        expect(page).to have_content("Name: #{@guitar_4.name}")
        expect(page).to have_content("Used?: #{@guitar_4.used}")
        expect(page).to have_content("Price: $#{@guitar_4.price}")
      end
    end

    describe "Store's Guitar Creation" do
      it "displays a link to add a guitar to the store" do
        visit("/stores/#{@store_1.id}/guitars")

        expect(page).to have_link("Create Guitar")
      end

      it "directs to Store Guitars new page when link is clicked" do
        visit("/stores/#{@store_1.id}/guitars")

        click_link("Create Guitar")

        expect(current_path).to eq("/stores/#{@store_1.id}/guitars/new")
      end
    end
  end
end