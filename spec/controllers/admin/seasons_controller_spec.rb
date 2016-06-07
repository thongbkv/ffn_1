require "rails_helper"

RSpec.describe Admin::SeasonsController, type: :controller do
  let(:user) {FactoryGirl.create :admin}
  let(:season) {FactoryGirl.create :season}
  subject{{admin: admin, season: season}}

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
      @season = Season.create(name: "test", description: "test",
        number_of_team: 30, number_of_match: 16)
    end

    it "should update with valid value" do
      patch :update, id: @season.id, season: {name: "Framgia"}
      expect(assigns(:season).name).to eq("Framgia")
    end

    it "should not update with invalid value" do
      befor_update = @season
      patch :update, id: @season.id, season:{name: ""}
      expect(@season).to eq(befor_update)
    end

    it "should redirect to seasons_path after updating valid" do
      patch :update, id: @season.id, season: {name: "Framgia"}
      expect(response).to redirect_to(admin_seasons_path)
    end

    it "should redirect to seasons_path after updating valid" do
      patch :update, id: @season.id, season:{name: ""}
      expect(response).to render_template("edit")
    end
  end
 
  before :each do
    @season = FactoryGirl.create(:season)
  end

  it "destroy season" do
    expect{delete :destroy, id: @season}.to change(Season,:count).by(-1)
    expect(response).to redirect_to admin_seasons_path
  end
end
