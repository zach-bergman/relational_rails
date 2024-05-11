require "rails_helper"

describe Guitar do
  # describe "validations" do
  #   it { should validate_presense_of :name }
  #   it { should validate_presense_of :used }
  #   it { should validate_presense_of :price }
  # end
  
  describe "relationship" do
    it {should belong_to :store}
  end
end