require "rails_helper"

describe "Store Show Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
  end

  describe "as a visitor" do
    describe "when I visit the store show page" do
      it "displays the header" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_content("#{@store_1.name}")
      end

      it "displays the stores attributes" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_content("Name: #{@store_1.name}")
        expect(page).to have_content("Ongoing Sale?: #{@store_1.ongoing_sale}")
        expect(page).to have_content("Annual Revenue: #{@store_1.annual_revenue}")
      end
    end
  end
end