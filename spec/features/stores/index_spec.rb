require "rails_helper"

describe "Stores Index Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @store_3 = Store.create!(name: "Happy Strings", ongoing_sale: true, annual_revenue: 50000)
  end

  describe "As a Visitor" do
    describe "When I visit the stores index page" do
      it "has a header" do
        visit("/stores")

        expect(page).to have_content("Names of all of the Stores!")
      end

      it "displays the name of each store in the database" do
        visit("/stores")

        expect(page).to have_content(@store_1.name)
        expect(page).to have_content(@store_2.name)
        expect(page).to have_content(@store_3.name)
      end
    end
  end
end