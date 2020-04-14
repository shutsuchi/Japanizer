class LikesController < ApplicationController
  def index
  end

  def create
    @post = find_post(params[:post_id])
    like = current_user.likes.new(post_id: @post.id)
    respond_to do |format|
      if like.save
        format.js
      end
    end
  end

  def destroy
    @post = find_post(params[:post_id])
    like = current_user.likes.find_by(post_id: @post.id)
    respond_to do |format|
      if like.destroy
        format.js
      end
    end
  end

  private

    def find_post(post_id)
      Post.find(post_id)
    end
end
