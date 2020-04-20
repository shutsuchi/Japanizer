class PostCommentsController < ApplicationController
  protect_from_forgery

  # POST /posts/:post_id/post_comments
  # post_post_comments_path
  def create
    @thepost = find_post(params[:post_id])
    @comments_pg = @thepost.post_comments.page(params[:page]).reverse_order.per(5)
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = @thepost.id
    respond_to do |format|
      if comment.save
        format.js
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

  def find_comment(post_comment_id)
    PostComment.find(post_comment_id)
  end

  def find_post(post_id)
    Post.find(post_id)
  end
end
