class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def show
  end

  def new
  end

  def create
    @comment.user = current_user
    if @comment.save
      flash[:success] = t "comment.success"
      respond_to do |format|
        format.html {redirect_to @comment.post}
        format.js
      end
    else
      flash[:danger] = t "comment.error"
      redirect_to @comment.post
    end
  end

  def edit
  end

  def update
    if @comment.update_attributes comment_params
      flash[:success] = t "comment.update_success"
      redirect_to @comment.post
    else
      flash[:danger] = t "comment.update_error"
      render :edit
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html {redirect_to @comment.post}
      format.js
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content, :image, :post_id
  end
end
