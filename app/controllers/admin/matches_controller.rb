class Admin::MatchesController < ApplicationController
  load_and_authorize_resource
  before_action :load_seasons, except: [:index, :destroy]
  before_action :load_teams, except: [:index, :destroy]
  before_action :load_team_matches
  
  def index
    @q = Match.search params[:q]
    @matches = @q.result distinct: true
  end

  def new
    2.times do
      @match.team_matches.build
    end
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
    params.require(:match).permit :name, :description, :start_date,
      :hour, :stadium, :season_id,
      team_matches_attributes: [:id, :team_id, :goals, :points]
  end

  def load_seasons
    @seasons = Season.all
  end

  def load_teams
    @teams = Team.all
  end

  def load_team_matches
    @team_matches = TeamMatch.all
  end
end
