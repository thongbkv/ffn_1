require "rails_helper"
require "rspec/mocks"

RSpec.describe Bet, type: :model do
  let(:bet) {FactoryGirl.create :bet}
  subject{bet}
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

  describe "Bet" do
    before {FactoryGirl.create :user}
    it {is_expected.to callback(:send_mail).after(:save) }
  end

  describe "#is_win_of_team?" do
    let(:win_team_id) {Bet.find_by team_id: 1}
    let(:different_win_team_id) {Bet.find_by team_id: 2

    it {expect(subject.is_win_of_team? 1).to eq true}
    it {expect(subject.is_win_of_team? 2).to eq false}
  end
end
