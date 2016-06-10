require "rails_helper"

RSpec.describe Admin::MatchesController, type: :controller do
  let(:user) {FactoryGirl.create :admin}
  let(:match) {FactoryGirl.create :match}
  subject{{admin: admin, match: match}}

  before do
    extend ControllerMacros
    login_admin
  end

  describe "test index" do
    it "login_admin" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end

  describe "test new" do
    it "login_admin" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template :new
    end
  end

  describe "test update" do
    before do
      @match = Match.create(name: "test", description: "test")
    end

    it "should update with valid value" do
      patch :update, id: @match.id, match: {name: "Framgia"}
      expect(assigns(:match).name).to eq("Framgia")
    end

    it "should not update with invalid value" do
      befor_update = @match
      patch :update, id: @match.id, match:{name: ""}
      expect(@match).to eq(befor_update)
    end

    it "should redirect to matchs_path after updating valid" do
      patch :update, id: @match.id, match: {name: "Framgia"}
      expect(response).to redirect_to(admin_matches_path)
    end

    it "should redirect to matchs_path after updating valid" do
      patch :update, id: @match.id, match:{name: ""}
      expect(response).to render_template("edit")
    end
  end
 
  before :each do
    @match = FactoryGirl.create(:match)
  end

  it "destroy match" do
    expect{delete :destroy, id: @match}.to change(Match,:count).by(-1)
    expect(response).to redirect_to admin_matches_path
  end
end
