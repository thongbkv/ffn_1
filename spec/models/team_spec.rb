require "rails_helper"

RSpec.describe Team, type: :model do
  let(:team) {FactoryGirl.create :team}

  describe "Association" do
    it "should has_many players" do
      t = Team.reflect_on_association(:players)
      t.macro.should eq :has_many
    end

    it "should has_many season_teams" do
      t = Team.reflect_on_association(:season_teams)
      t.macro.should eq :has_many
    end

    it "should has_many team_matches" do
      t = Team.reflect_on_association(:team_matches)
      t.macro.should eq :has_many
    end

    it "should has_many matches" do
      t = Team.reflect_on_association(:matches)
      t.macro.should eq :has_many
    end

    it "should has_many seasons" do
      t = Team.reflect_on_association(:seasons)
      t.macro.should eq :has_many
    end
  end

  describe "Validations" do
    subject {team}

    context "when name is nil" do
      before {subject.name = nil}
      it {is_expected.to be_invalid}
    end

    context "when name is not nil" do
      it {is_expected.to  be_valid}
    end
  end
end
