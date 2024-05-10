require "rails_helper"

describe Store do
  describe "relationship" do
    it {should have_many :guitars}
  end
end