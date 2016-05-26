class Admin::TeamsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @team.save
      flash[:success] = t "admin.team.create_success"
      redirect_to admin_teams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @team.update_attributes team_params
      flash[:success] = t "admin.team.update_success"
      redirect_to admin_teams_path
    else
      flash[:danger] = t "admin.team.update_error"
      render :edit
    end
  end

  def destroy
    if @team.destroy
      flash[:success] = t "admin.team.delete_success"
    else
      flash[:danger] = t "admin.team.delete_error"
    end
    redirect_to admin_teams_path
  end

  private
  def team_params
    params.require(:team).permit :name, :logo, :coach, :country
  end
end
