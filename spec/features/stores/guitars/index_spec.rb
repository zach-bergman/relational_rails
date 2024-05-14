require "rails_helper"

describe "Store Guitars Index Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)

    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @guitar_3 = @store_2.guitars.create!(name: "Epiphone Les Paul", used: false, price: 680)
    @guitar_4 = @store_2.guitars.create!(name: "Schecter Omen", used: true, price: 500)
  end

  describe "as a visitor" do
    describe "when I visit the store-guitars index page" do
      it "shows all of the guitars being sold by store 1" do
        visit("/stores/#{@store_1.id}/guitars")

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

    describe "Sort Store's Guitars Alphabetically By Name" do
      it "displays a link to sort all guitars alphabetically" do
        visit("/stores/#{@store_1.id}/guitars")

        expect(@guitar_2.name).to appear_before(@guitar_1.name)

        click_link("Sort Alphabetically")
        
        expect(@guitar_1.name).to appear_before(@guitar_2.name)
      end
    end

    describe "Guitar Update from Stores-Guitars Index Page" do
      it "displays an update button next to each Guitar" do
        visit("/stores/#{@store_1.id}/guitars")

        expect(page).to have_button("Update #{@guitar_1.name}")
        expect(page).to have_button("Update #{@guitar_2.name}")

        visit("/stores/#{@store_2.id}/guitars")

        expect(page).to have_button("Update #{@guitar_3.name}")
        expect(page).to have_button("Update #{@guitar_4.name}")
      end

      it "links to Guitar edit page when button is clicked" do
        visit("/stores/#{@store_1.id}/guitars")

        click_button("Update #{@guitar_1.name}")

        expect(current_path).to eq("/guitars/#{@guitar_1.id}/edit")

        visit("/stores/#{@store_1.id}/guitars")

        click_button("Update #{@guitar_2.name}")

        expect(current_path).to eq("/guitars/#{@guitar_2.id}/edit")

        visit("/stores/#{@store_2.id}/guitars")

        click_button("Update #{@guitar_3.name}")

        expect(current_path).to eq("/guitars/#{@guitar_3.id}/edit")

        visit("/stores/#{@store_2.id}/guitars")

        click_button("Update #{@guitar_4.name}")

        expect(current_path).to eq("/guitars/#{@guitar_4.id}/edit")
      end
    end

    describe "Display Records with Given Threshold" do
      it "displays a form to enter a price, only displays guitars that cost over the price entered" do
        visit("/stores/#{@store_1.id}/guitars")

        fill_in(:price, with: 600)
        click_button("Only return guitars that cost more than price")
        
        expect(page).to have_content("Fender Stratocaster")
        expect(page).to_not have_content("Ibanez RG470DX")
      end
    end

    describe "Guitar Delete" do
      it "displays a delete button" do
        visit("/stores/#{@store_1.id}/guitars")

        expect(page).to have_button("Delete #{@guitar_1.name}")
        expect(page).to have_button("Delete #{@guitar_2.name}")
      end

      it "returns to guitars index page when delete button is clicked" do
        visit("/stores/#{@store_1.id}/guitars")

        click_button("Delete #{@guitar_1.name}")

        expect(current_path).to eq("/guitars")
      end

      it "deletes the guitar when the delete button is clicked" do
        visit("/stores/#{@store_1.id}/guitars")

        click_button("Delete #{@guitar_1.name}")

        expect(page).to_not have_content("Fender Stratocaster")

        visit("/guitars")

        expect(page).to_not have_content("Fender Stratocaster")
      end
    end
  end
end