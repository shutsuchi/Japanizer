class LikesController < ApplicationController
  def index
  end

  def create
    @post = find_post(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    respond_to do |format|
      if favorite.save!
        format.js
      end
    end
  end

  def destroy
    @post = find_post(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    respond_to do |format|
      if favorite.destroy!
        format.js
      end
    end
  end
end
