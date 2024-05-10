require "rails_helper"

describe "Home Index Page" do
  context "as a visitor"  do
    describe "when I visit the home page" do
      it "has a header" do
        visit("/")

        expect(page).to have_content("Welcome!")
      end

      it "has two list items" do
        visit("/")

        expect(page).to have_content("Store Index")
        expect(page).to have_content("New Store")
      end

      it "has list items that link to other pages"
    end
  end
end