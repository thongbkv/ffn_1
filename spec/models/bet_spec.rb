require "rails_helper"
require "rspec/mocks"

RSpec.describe Bet, type: :model do
  let(:bet) {FactoryGirl.create :bet}

  describe "Associations" do
    it "should belongs_to User" do
      t = Bet.reflect_on_association(:user)
      t.macro.should eq :belongs_to
    end

    it "should belongs_to Match" do
      t = Bet.reflect_on_association(:match)
      t.macro.should eq :belongs_to
    end

  end
end
