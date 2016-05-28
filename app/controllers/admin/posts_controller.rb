class Admin::PostsController < ApplicationController
  load_and_authorize_resource
  before_action :load_seasons, :load_matches, except: [:index, :destroy]

  def index
  end

  def new
  end

  def create
    if @post.save
      flash[:success] = t "admin.post.create_success"
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t "admin.post.update_success"
      redirect_to admin_posts_path
    else
      flash[:danger] = t "admin.post.update_error"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t "admin.post.delete_success"
    else
      flash[:danger] = t "admin.post.delete_error"
    end
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit :title, :content, :image, :season_id, :match_id
  end

  def load_seasons
    @seasons = Season.all
  end

  def load_matches
    @matches = Match.all
  end
end
