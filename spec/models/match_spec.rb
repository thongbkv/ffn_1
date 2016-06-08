require "rails_helper"
RSpec.describe Match, type: :model do
  let(:match) {FactoryGirl.create :match}

  describe "Associations" do

    it "should belongs_to season" do
      t = Match.reflect_on_association(:season)
      t.macro.should eq :belongs_to
    end

    it "should has_many post" do
      t = Match.reflect_on_association(:posts)
      t.macro.should eq :has_many
    end

    it "should has_many bet" do
      t = Match.reflect_on_association(:bets)
      t.macro.should eq :has_many
    end
  end

  describe "valadates" do
    context "name is not valid" do
      before {match.name = nil}
      it {should_not be_valid}
    end

    context "name have length greater 50 character" do
      it {should validate_length_of(:name).is_at_most(50)}
    end
  end

    context "description is not valid" do
      before {match.description = nil}
      it {should_not be_valid}
    end

    context "description have length greater 255 character" do
      it {should validate_length_of(:description).is_at_most(255)}
    end
end
