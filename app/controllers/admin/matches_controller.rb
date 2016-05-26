class Admin::MatchesController < ApplicationController
  load_and_authorize_resource
  before_action :load_season, only: [:edit, :new]

  def index
  end

  def new
  end

  def edit
  end

  def create
    if @match.save
      flash[:success] = t "admin.match.create_success"
      redirect_to admin_matches_path
    else
      render :new
    end
  end

  def update
    # if params[:match][:season_id]
    #   params[:match][:season_id] = params[:match][:season_id][0].to_i
    # end
    if @match.update_attributes match_params
      flash[:success] = t "admin.match.update_success"
      redirect_to admin_matches_path
    else
      flash[:danger] = t "admin.match.update_error"
      render :edit
    end
  end

  def destroy
    if @match.destroy
      flash[:success] = t "admin.match.delete_message"
      redirect_to admin_matches_path
    else
      flash[:danger] = t "admin.match.delete_error"
      render :index
    end
  end

  private
  def match_params
    params.require(:match).permit :name, :description, :start_date, :hour, :stadium, :season_id
  end

  def load_season
    @seasons = Season.all
  end
end
