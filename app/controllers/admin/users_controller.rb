class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @q = User.search params[:q]
    @users = @q.result distinct: true
  end

  def show
  end

  def new
  end

  def create
    if @user.save
      flash.now[:success] = t "admin.user.create_user_success"
      redirect_to admin_users_path
    else
      flash.now[:warning] = "admin.user.create_user_error"
      render :new
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.user.destroy_success"
      redirect_to admin_users_path
    end
  end

  private
  def user_params
    params.require(:user).permit :email, :encrypted_password,
      :reset_password_token
  end
end
