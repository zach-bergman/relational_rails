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

      describe "Guitar Update" do
        it "displays a link to update the guitar" do
          visit("/guitars/#{@guitar_1.id}")

          expect(page).to have_link("Update #{@guitar_1.name}")
        end

        it "links to guitar edit page when link is clicked" do
          visit("/guitars/#{@guitar_1.id}")

          click_link("Update #{@guitar_1.name}")

          expect(current_path).to eq("/guitars/#{@guitar_1.id}/edit")
        end
      end

      describe "Guitar Delete" do
        it "displays a delete button" do
          visit("/guitars/#{@guitar_1.id}")
  
          expect(page).to have_button("Delete #{@guitar_1.name}")
        end
  
        it "redirects to guitar index page when delete button is clicked" do
          visit("/guitars/#{@guitar_1.id}")
  
          click_button("Delete #{@guitar_1.name}")
  
          expect(current_path).to eq("/guitars")
        end
  
        it "the guitar is deleted when delete button is clicked" do
          visit("/guitars/#{@guitar_1.id}")
  
          click_button("Delete")
  
          expect(page).to_not have_content("Fender Stratocaster")
  
          visit("/guitars")
  
          expect(page).to_not have_content("Fender Stratocaster")
        end
      end
    end
  end
end