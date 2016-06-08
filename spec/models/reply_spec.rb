require "rails_helper"

RSpec.describe Reply, type: :model do
  let(:reply) {FactoryGirl.create :reply}

  describe "Associations"  do

    it "should belongs_to comment" do
      t = Reply.reflect_on_association(:comment)
      t.macro.should eq :belongs_to
    end

    it "should belongs_to user" do
      t = Reply.reflect_on_association(:user)
      t.macro.should eq :belongs_to
    end
  end

  describe "Validations" do
    subject {reply}

    context "when content is nil" do
      before {reply.content = nil}
      it {is_expected.to be_invalid}
    end

    context "when content is not nil" do
      it {is_expected.to be_valid}
    end
  end
end
