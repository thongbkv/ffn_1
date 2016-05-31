class StaticPagesController < ApplicationController
  before_action :load_seasons, only: :home

  def home
    @posts = Post.order_by_date
  end

  def help
  end

  private
  def load_seasons
    @seasons = Season.all
  end
end
