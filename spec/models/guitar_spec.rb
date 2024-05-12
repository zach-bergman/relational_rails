require "rails_helper"

describe Guitar do
  before(:each) do
    @store_1 = Store.create!(name: "Guitar Center", ongoing_sale: true, annual_revenue: 100000)
    @guitar_1 = @store_1.guitars.create!(name: "Fender Stratocaster", used: true, price: 680)
    @guitar_2 = @store_1.guitars.create!(name: "Ibanez RG470DX", used: false, price: 500)
    @guitar_3 = @store_1.guitars.create!(name: "Schecter Omen", used: true, price: 720)
  end
  # describe "validations" do
  #   it { should validate_presense_of :name }
  #   it { should validate_presense_of :used }
  #   it { should validate_presense_of :price }
  # end
  
  describe "relationship" do
    it {should belong_to :store}
  end

  describe ".display_used_guitars" do
    it "only displays used guitars" do
      expect(Guitar.display_used_guitars).to eq([@guitar_1, @guitar_3])
    end
  end

  describe ".sort_by_name" do
    it "sorts guitars alphabetically by name" do
      expect(Guitar.sort_by_name).to eq([@guitar_1, @guitar_2, @guitar_3])
    end
  end
end