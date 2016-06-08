require "rails_helper"
require "rspec/mocks"

RSpec.describe Player, type: :model do
  let(:player) {FactoryGirl.create :player}

  describe "Associations" do
    it "should belongs_to Team" do
      t = Player.reflect_on_association(:team)
      t.macro.should eq :belongs_to
    end
  end

  describe "Validattions" do
    subject{player}

    context "when name is nil" do
      before {subject.name = nil}
      it {is_expected.to be_invalid}
    end
    context "when name is not nil" do
      it {is_expected.to be_valid}
    end
    context "when name length greater 50 character" do
      it {should validate_length_of(:name).is_at_most(50)}
    end

    context "when position is nil" do
      before {subject.position = nil}
      it {is_expected.to be_invalid}
    end
    context "when position is not nil" do
      it {is_expected.to be_valid}
    end
    context "when position length greater 20 character" do
      it {should validate_length_of(:position).is_at_most(20)}
    end

    context "when nationality is nil" do
      before {subject.nationality = nil}
      it {is_expected.to be_invalid}
    end
    context "when nationality is not nil" do
      it {is_expected.to be_valid}
    end
    context "when nationality length greater 20 character" do
      it {should validate_length_of(:nationality).is_at_most(20)}
    end

    context "when jersey_number is nil" do
      before {subject.jersey_number = nil}
      it {is_expected.to be_invalid}
    end
    context "when jersey_number is not nil" do
      it {is_expected.to be_valid}
    end
    context "when jersey_number is number" do
      it {expect(subject.jersey_number).to be_a Integer}
    end
    context "when jersey_number is not number" do
      it {expect(subject.jersey_number).to be > 0}
    end
  end
end
