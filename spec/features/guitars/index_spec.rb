require "rails_helper"

describe "Guitars Index Page" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: true, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: false, price: 500)
    @guitar_3 = @store_1.guitars.create!(name: "Schecter Omen", used: true, price: 720)
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

        expect(page).to have_content("Name: #{@guitar_3.name}")
        expect(page).to have_content("Used?: #{@guitar_3.used}")
        expect(page).to have_content("Price: $#{@guitar_3.price}")
      end

      it "only displays used guitars - used = true" do
        visit("/guitars")

        expect(page).to have_content("Name: #{@guitar_1.name}")
        expect(page).to have_content("Used?: #{@guitar_1.used}")
        expect(page).to have_content("Price: $#{@guitar_1.price}")

        expect(page).to_not have_content("Name: #{@guitar_2.name}")
        expect(page).to_not have_content("Used?: #{@guitar_2.used}")
        expect(page).to_not have_content("Price: $#{@guitar_2.price}")
      end
    end

    describe "Guitar Update from Index Page" do
      it "displays an update button next to each Guitar" do
        visit("/guitars")

        expect(page).to have_button("Update #{@guitar_1.name}")
        expect(page).to have_button("Update #{@guitar_3.name}")
      end

      it "links to Guitar edit page when button is clicked" do
        visit("/guitars")

        click_button("Update #{@guitar_1.name}")

        expect(current_path).to eq("/guitars/#{@guitar_1.id}/edit")

        visit("/guitars")

        click_button("Update #{@guitar_3.name}")

        expect(current_path).to eq("/guitars/#{@guitar_3.id}/edit")
      end
    end

    describe "Guitar Delete" do
      it "displays a delete button" do
        visit("/guitars")

        expect(page).to have_button("Delete #{@guitar_1.name}")
        expect(page).to have_button("Delete #{@guitar_3.name}")
      end

      it "returns to guitars index page when delete button is clicked" do
        visit("/guitars")

        click_button("Delete #{@guitar_1.name}")

        expect(current_path).to eq("/guitars")
      end

      it "deletes the guitar when the delete button is clicked" do
        visit("/guitars")

        click_button("Delete #{@guitar_1.name}")

        expect(page).to_not have_content("Fender Stratocaster")
      end
    end
  end
end