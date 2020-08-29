class LikesController < ApplicationController
  before_action :authenticate_user!

  # POST /posts/:post_id/likes
  # post_likes_path
  def create
    @post = find_post(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    respond_to do |format|
      format.js if like.save
    end
  end

  # DELETE /posts/:post_id/likes
  # post_likes_path
  def destroy
    @post = find_post(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    respond_to do |format|
      format.js if like.destroy
    end
  end

  private

  def find_post(post_id)
    Post.find(post_id)
  end

end
