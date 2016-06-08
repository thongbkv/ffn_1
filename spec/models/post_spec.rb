require "rails_helper"

RSpec.describe Post, type: :model do
  let(:post) {FactoryGirl.create :post}

  describe "Association" do
    it "should belongs_to season" do
      t = Post.reflect_on_association(:season)
      t.macro.should eq :belongs_to
    end

    it "should belongs_to match" do
      t = Post.reflect_on_association(:match)
      t.macro.should eq :belongs_to
    end

    it "should has_many comments" do
      t = Post.reflect_on_association(:comments)
      t.macro.should eq :has_many
    end
  end

  describe "Validations" do
    subject {post}

    context "when title is nil" do
      before {subject.title = nil}
      it {is_expected.to be_invalid}
    end

    context "when title is not nil" do
      it {is_expected.to be_valid}
    end

    context "when content is nil" do
      before {subject.content = nil}
      it {is_expected.to be_invalid}
    end

    context "when content is not nil" do
      it {is_expected.to be_valid}
    end
  end
end
