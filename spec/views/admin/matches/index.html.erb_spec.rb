require "rails_helper"

describe "admin/matches/index.html.erb", type: :view do
  let(:admin) {FactoryGirl.create :admin}
  let(:match) {FactoryGirl.create :match}
  let(:season) {FactoryGirl.create :season}
  let(:matches) {Match.all.page(1)}
  before do
    user = FactoryGirl.create(:admin)
    sign_in user
    assign :matches, matches
    assign(:q, Match.ransack(params[:q]))
    render
  end

  it do
    expect(controller.request.path_parameters[:controller]).to eq "admin/matches"
    expect(controller.request.path_parameters[:action]).to eq "index"
  end

  it do
    expect(rendered).to have_content match.name
  end
end
