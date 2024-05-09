require "rails_helper"

describe "Guitar Show Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
  end

  describe "as a visitor" do
    describe "when I visit the guitar show page" do
      it "displays the header" do
        visit("/guitars/#{@guitar_1.id}")

        expect(page).to have_content("#{@guitar_1.name}")
      end

      it "displays the guitars attributes" do
        visit("/guitars/#{@guitar_1.id}")

        expect(page).to have_content("Name: #{@guitar_1.name}")
        expect(page).to have_content("Used?: #{@guitar_1.used}")
        expect(page).to have_content("Price: $#{@guitar_1.price}")
      end
    end
  end
end