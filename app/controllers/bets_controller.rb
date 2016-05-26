class BetsController < ApplicationController
  load_and_authorize_resource :match, except: [:edit, :update]
  load_and_authorize_resource
  
  def new
  end

  def edit
  end

  def create
    @bet.user = current_user
    @bet.match = @match
    if @bet.save
      flash[:success] = t "admin.match.create_success"
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @bet.update_attributes bet_params
      flash[:success] = t "admin.match.update_success"
      redirect_to root_path
    else
      flash[:danger] = t "admin.match.update_error"
      render :edit
    end
  end

  private
  def bet_params
    params.require(:bet).permit :team_id
  end
end
