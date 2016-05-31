class PostsController < ApplicationController
  load_and_authorize_resource

  def show
    @comment = Comment.new
    @seasons = Season.all
  end
end
