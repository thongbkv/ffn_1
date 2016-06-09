require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  let(:admin) {FactoryGirl.create :admin}
  let(:member) {FactoryGirl.create :member}
  subject{{admin: admin, member: member}}

  before do
    extend ControllerMacros
    login_admin
  end

  describe "GET index" do
    it "login_admin" do
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template :index
    end
  end

  before :each do
    @user = FactoryGirl.create(:member)
  end

  it "deletes the user" do
    expect{delete :destroy, id: @user}.to change(User,:count).by(-1)
    expect(response).to redirect_to admin_users_path
  end
end
