module ControllerMacros
  def login_admin
    user = FactoryGirl.create(:admin)
    sign_in user
  end
end
