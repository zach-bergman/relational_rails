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
        
        expect(@store_3.name).to appear_before(@store_2.name)
        expect(@store_2.name).to appear_before(@store_1.name)
      end

      it "displays the created at timestamp with each store in the database" do
        visit("/stores")

        expect(page).to have_content(@store_3.created_at)
        expect(page).to have_content(@store_2.created_at)
        expect(page).to have_content(@store_1.created_at)
      end

      describe "Store Creation" do
        it "displays a link to create a new store record" do
          visit("/stores")

          expect(page).to have_link("New Store")
        end

        it "links to /stores/new when link is clicked on" do
          visit("/stores")

          click_link("New Store")

          expect(page).to have_current_path("/stores/new")
        end
      end

      describe "Store Update from Index Page" do
        it "displays an update button next to each Store" do
          visit("/stores")

          expect(page).to have_button("Update #{@store_1.name}")
          expect(page).to have_button("Update #{@store_2.name}")
          expect(page).to have_button("Update #{@store_3.name}")
        end

        it "links to Store edit page when button is clicked" do
          visit("/stores")

          click_button("Update #{@store_1.name}")

          expect(current_path).to eq("/stores/#{@store_1.id}/edit")

          visit("/stores")

          click_button("Update #{@store_2.name}")

          expect(current_path).to eq("/stores/#{@store_2.id}/edit")

          visit("/stores")

          click_button("Update #{@store_3.name}")

          expect(current_path).to eq("/stores/#{@store_3.id}/edit")
        end
      end
    end
  end
end