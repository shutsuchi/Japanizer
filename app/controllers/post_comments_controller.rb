class PostCommentsController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery

  include Page

  # POST /posts/:post_id/post_comments
  # post_post_comments_path
  def create
    @thepost = find_post(params[:post_id])
    @comments_pg = page_5(@thepost.post_comments)
    @comment = current_user.post_comments.new(post_comment_params)
    @comment.post_id = @thepost.id
    respond_to do |format|
      if @comment.save
        @comment = PostComment.new
        format.js { render :create }
      else
        @comments = @thepost.post_comments
        flash.now[:alert] = t('posts.cm_flash.s_alert')
        format.js { render :show }
        #render post_path(@thepost)
      end
    end
  end

  # PATCH /posts/:post_id/post_comments
  # post_post_comments_path
  def update
    @comment = find_comment(params[:id])
    @comment.update(post_comment_params)
    render json: @comment
  end

  # DELETE /posts/:post_id/post_comments
  # post_post_comments_path
  def destroy
    @comment = find_comment(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.js
      end
    end
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:title, :comment, :rate)
  end

  def find_comment(comment_id)
    PostComment.find(comment_id)
  end

  def find_post(post_id)
    Post.find(post_id)
  end
end
