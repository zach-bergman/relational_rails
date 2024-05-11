require "rails_helper"

describe "navbar" do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)
  end
  
  it "displays navbar on all pages" do
    visit("/")
    expect(page).to have_selector("nav")

    visit("/stores")
    expect(page).to have_selector("nav")

    visit("/stores/new")
    expect(page).to have_selector("nav")

    visit("/stores/#{@store_1.id}")
    expect(page).to have_selector("nav")

    visit("/guitars")
    expect(page).to have_selector("nav")

    visit("/guitars/#{@guitar_1.id}")
    expect(page).to have_selector("nav")

    visit("/stores/#{@store_1.id}/guitars")
    expect(page).to have_selector("nav")
  end

  it "has a link to the guitars index page" do
    visit("/")

    within "navbar" do
      expect(page).to have_link("All Guitars")

      click_link("All Guitars")
    end

    expect(page).to have_current_path("/guitars")
  end

  it "has a link to the stores index page" do
    visit("/")

    within "navbar" do
      expect(page).to have_link("All Stores")

      click_link("All Stores")
    end

    expect(page).to have_current_path("/stores")
  end
end