require "rails_helper"

describe "Home Index Page" do
  context "as a visitor"  do
    describe "when I visit the home page" do
      it "has a header" do
        visit("/")

        expect(page).to have_content("Stores and Guitars")
      end

      it "has four list items" do
        visit("/")

        expect(page).to have_content("View Stores")
        expect(page).to have_content("New Store")
        expect(page).to have_content("View Guitars")
        expect(page).to have_content("New Guitar")
      end

      it "has list items that link to other pages" do
        visit("/")

        click_link("View Stores")

        expect(page).to have_current_path("/stores")

        visit("/")

        click_link("New Store")

        expect(page).to have_current_path("/stores/new")

        visit("/")

        click_link("View Guitars")

        expect(page).to have_current_path("/guitars")

        visit("/")

        click_link("New Guitar")

        expect(page).to have_current_path("/guitars/new")
      end
    end
  end
end