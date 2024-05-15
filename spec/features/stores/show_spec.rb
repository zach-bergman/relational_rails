require "rails_helper"

describe "Store Show Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)

    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @guitar_3 = @store_2.guitars.create!(name: "Epiphone Les Paul", used: false, price: 680)
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
        expect(page).to have_content("Annual Revenue: $100,000")
      end

      it "displays the count of guitars being sold by the store" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_content("Stock Count: #{@store_1.guitar_count}")

        visit("/stores/#{@store_2.id}")

        expect(page).to have_content("Stock Count: #{@store_2.guitar_count}")
      end

      it "displays a link to a list of all guitars sold at store" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_link("Shop #{@store_1.name}'s Guitars")
        
        click_link("Shop #{@store_1.name}'s Guitars")

        expect(current_path).to eq("/stores/#{@store_1.id}/guitars")
      end
    end

    describe "Store Update" do
      it "displays a link to update the store" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_link("Update #{@store_1.name}")
      end

      it "links to store edit page when link is clicked" do
        visit("/stores/#{@store_1.id}")

        click_link("Update #{@store_1.name}")

        expect(current_path).to eq("/stores/#{@store_1.id}/edit")
      end
    end

    describe "Store Delete" do
      it "displays a delete button" do
        visit("/stores/#{@store_1.id}")

        expect(page).to have_button("Delete")
      end

      it "redirects to store index page when delete button is clicked" do
        visit("/stores/#{@store_1.id}")

        click_button("Delete")

        expect(current_path).to eq("/stores")
      end

      it "the store is deleted when delete button is clicked" do
        visit("/stores/#{@store_1.id}")

        click_button("Delete")

        expect(page).to_not have_content("Guitar Center")

        visit("/stores")

        expect(page).to_not have_content("Guitar Center")
      end

      it "deletes the stores guitars when delete button is clicked" do
        visit("/stores/#{@store_1.id}")

        click_button("Delete")

        visit("/guitars")

        expect(page).to_not have_content("Fender Stratocaster")
        expect(page).to_not have_content("Ibanez RG470DX")
      end
    end
  end
end