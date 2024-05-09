require "rails_helper"

describe "Guitars Index Page" do
  before(:each) do
    @guitar_1 = Guitar.create!(store_id: 1, name: "Fender Stratocaster", used: false, price: 680)
    @guitar_2 = Guitar.create!(store_id: 1, name: "Ibanez RG470DX", used: false, price: 500)
  end

  describe "As a Visitor" do
    describe "When I visit the guitars index page" do
      it "has a header" do
        visit("/guitars")

        expect(page).to have_content("Guitars in Stock")
      end

      it "displays the guitars attributes" do
        visit("/guitars")

        expect(page).to have_content(@guitar_1.store_id)
        expect(page).to have_content(@guitar_1.name)
        expect(page).to have_content(@guitar_1.used)
        expect(page).to have_content(@guitar_1.price)

        expect(page).to have_content(@guitar_2.store_id)
        expect(page).to have_content(@guitar_2.name)
        expect(page).to have_content(@guitar_2.used)
        expect(page).to have_content(@guitar_2.price)
      end
    end
  end
end