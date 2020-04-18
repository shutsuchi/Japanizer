class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ show edit update withdraw ]
  before_action :correct_user, only: %i[ show edit withdraw ]

  def show
    @theuser = current_user
    @posts = @theuser.posts.all
    @albums = @theuser.albums.all
    @event = Event.new
    @events = Event.where(user_id: @theuser.id)

    # User が獲得した対象カウント
    @posts = @theuser.posts.all
    @albums = @theuser.albums.all
    @get_likes = @posts.each do |post|
                  like_count = 0
                  like_count = Like.where(post_id: post.id).count
                  like_count += like_count
                end
    @get_comments = @posts.each do |post|
                      comment_count = 0
                      comment_count = PostComment.where(post_id: post.id).count
                      comment_count += comment_count
                    end
    @get_bookmarks = @albums.each do |album|
                        bookmark_count = 0
                        bookmark_count = Bookmark.where(album_id: album.id).count
                        bookmark_count += bookmark_count
                      end

    # User が実行した対象カウント
    @give_likes = Like.where(user_id: @theuser.id).all
    @give_comments = PostComment.where(user_id: @theuser.id).all
    @give_bookmarks = Bookmark.where(user_id: @theuser.id).all

    respond_to do |format|
      format.html
      format.json { render :json => @events }
    end
  end

  def edit
    @theuser = current_user
  end

  def withdraw
    @theuser = current_user
  end

  def switch
    @theuser = current_user
    if @theuser.update(withdrawal_flag: false)
      redirect_to top_path
    else
      render :withdraw
    end
  end

  def update
    @theuser = current_user
    if @theuser.update(user_params)
      redirect_to user_path(@theuser.id), notice: "Successfully Updated"
    else
      render :edit, notice: "Failed to Update"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :image, :age, :country_code)
  end

  def correct_user
    if params[:id]
      user = User.find(params[:id])
    else
      user = User.find(params[:user_id])
    end

    if user.id != current_user.id
      redirect_to top_path
    end
  end
end
