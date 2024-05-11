require "rails_helper"

describe Store do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @store_2 = Store.create!(name: "Guitar World", ongoing_sale: false, annual_revenue: 80000)
    @store_3 = Store.create!(name: "Happy Strings", ongoing_sale: true, annual_revenue: 50000)
  end

  # describe "validations" do
  #   it { should validate_presense_of :name }
  #   it { should validate_presense_of :used }
  #   it { should validate_presense_of :price }
  # end

  describe "relationship" do
    it {should have_many :guitars}
  end

  describe ".sort_by_created_at" do
    it "can sort the stores by the created at timestamp, with the most recently created first" do
      expect(Store.sort_by_created_at).to eq([@store_3, @store_2, @store_1])

      store_4 = Store.create!(name: "Sweetwater", ongoing_sale: true, annual_revenue: 90000)

      expect(Store.sort_by_created_at).to eq([store_4, @store_3, @store_2, @store_1])
    end
  end

  describe "#guitar_count" do
    it "can count the number of guitars being sold" do
      @store_1.guitars.create!(name: "Fender Stratocaster", used: false, price: 680)

      expect(@store_1.guitar_count).to eq(1)

      @store_1.guitars.create!(name: "Ibanez RG470DX", used: true, price: 500)

      expect(@store_1.guitar_count).to eq(2)
    end
  end
end