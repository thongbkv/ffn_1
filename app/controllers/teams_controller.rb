class TeamsController <ApplicationController
  load_and_authorize_resource

  def show
    @seasons = Season.all
  end
end
