class Admin::PlayersController < ApplicationController
  load_and_authorize_resource
  before_action :load_teams, only: [:new, :edit]

  def index
  end

  def new
  end

  def edit
  end

  def show
    @seasons = Season.all
  end

  def create
    if @player.save
      flash.now[:success] = t "admin.player.create_success"
      redirect_to admin_players_path
    else
      load_teams
      flash.now[:warning] = t "admin.player.wrong" 
      render :new
    end
  end

  def update
    if @player.update_attributes player_params
      flash[:success] = t "admin.player.update_player_success"
      respond_to do |format|
        format.html {redirect_to :back}
        format.js
      end
    else
      flash[:danger] = t "admin.player.update_player_error"
      render :edit
    end
  end

  def destroy
    @player.destroy
    flash[:success] = t "admin.player.delete_player_success"
    redirect_to admin_players_path
  end

  private
  def player_params
    params.require(:player).permit :name, :date_of_birth, :position,
      :jersey_number, :nationality, :image, :team_id
  end

  def load_teams
    @teams = Team.all
  end
end
