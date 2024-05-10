require "rails_helper"

describe Guitar do
  describe "relationship" do
    it {should belong_to :store}
  end
end