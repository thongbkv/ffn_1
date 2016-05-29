class StaticPagesController < ApplicationController
  before_action :load_seasons, only: :home

  def home
  end

  def help
  end

  private
  def load_seasons
    @seasons = Season.all
  end
end
