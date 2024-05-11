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

      it "orders the stores by most recently created" do
        visit("/stores")
        save_and_open_page
        expect(@store_3.name).to appear_before(@store_2.name)
        expect(@store_2.name).to appear_before(@store_1.name)
      end

      it "displays the created at timestamp with each store in the database" do
        visit("/stores")

        expect(page).to have_content(@store_3.created_at)
        expect(page).to have_content(@store_2.created_at)
        expect(page).to have_content(@store_1.created_at)
      end
    end
  end
end