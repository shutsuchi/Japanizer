class PostCommentsController < ApplicationController

  def create
    post = find_post(params[:post_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post
    end
  end

  def update
  end

  def destroy
    post = find_post(params[:post_id])
    comment = find_comment(params[:id])
    if comment.destroy
      redirect_to post
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
