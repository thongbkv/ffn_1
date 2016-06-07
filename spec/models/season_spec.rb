require "rails_helper"
require "rspec/mocks"

RSpec.describe Season, type: :model do
  let(:season) {FactoryGirl.create :season}

  describe "valadates" do
    context "name is not valid" do
      before {season.name = nil}
      it {should_not be_valid}
    end

    context "name have length greater 50 character" do
      it {should validate_length_of(:name).is_at_most(50)}
    end
  end

    context "description is not valid" do
      before {season.description = nil}
      it {should_not be_valid}
    end

    context "description have length greater 100 character" do
      it {should validate_length_of(:description).is_at_most(100)}
    end
end
