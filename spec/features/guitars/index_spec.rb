require "rails_helper"

describe "Guitars Index Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: false, price: 500)
  end

  describe "As a Visitor" do
    describe "When I visit the guitars index page" do
      it "has a header" do
        visit("/guitars")

        expect(page).to have_content("Guitars in Stock")
      end

      it "displays the guitars attributes" do
        visit("/guitars")

        expect(page).to have_content("Name: #{@guitar_1.name}")
        expect(page).to have_content("Used?: #{@guitar_1.used}")
        expect(page).to have_content("Price: $#{@guitar_1.price}")

        expect(page).to have_content("Name: #{@guitar_2.name}")
        expect(page).to have_content("Used?: #{@guitar_2.used}")
        expect(page).to have_content("Price: $#{@guitar_2.price}")
      end
    end
  end
end