require "rails_helper"

RSpec.describe Comment, type: :model do
  let(:comment) {FactoryGirl.create :comment}

  describe "Associations" do

    it "should belongs_to post" do
      t = Comment.reflect_on_association(:post)
      t.macro.should eq :belongs_to
    end

    it "should belongs_to user" do
      t = Comment.reflect_on_association(:user)
      t.macro.should eq :belongs_to
    end

    it "should has_many replies" do
      t = Comment.reflect_on_association(:replies)
      t.macro.should eq :has_many
    end
  end

  describe "Validations" do
    subject {comment}

    context "when connent is nil" do
      before {subject.content = nil}
      it {is_expected.to be_invalid}
    end

    context "when content is not nil" do
      it {is_expected.to be_valid}
    end
  end
end
