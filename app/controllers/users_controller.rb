class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update withdraw]
  before_action :correct_user, only: %i[show edit withdraw]

  def show
    pg_p = params[:post]
    pg_a = params[:album]
    @theuser = current_user
    @posts_pg = page_8(@theuser.posts, pg_p)
    @albums_pg = page_6(@theuser.albums, pg_a)
    @event = Event.new
    @events = Event.where(user_id: @theuser.id)

    # Count User Got
    like_count = 0
    comment_count = 0
    bookmark_count = 0
    @posts = @theuser.posts.all
    @albums = @theuser.albums.all
    @get_likes = @posts.each do |post|
                  lk_c = Like.where(post_id: post.id).count
                  like_count += lk_c
    end
    @get_comments = @posts.each do |post|
                      cm_c = PostComment.where(post_id: post.id).count
                      comment_count += cm_c
    end
    @get_bookmarks = @albums.each do |album|
                        bm_c = Bookmark.where(album_id: album.id).count
                        bookmark_count += bm_c
    end

    # Count User Gave
    @give_likes = Like.where(user_id: @theuser.id).all
    @give_comments = PostComment.where(user_id: @theuser.id).all
    @give_bookmarks = Bookmark.where(user_id: @theuser.id).all

    respond_to do |format|
      format.html
      format.json { render json: @events }
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
      redirect_to user_path(@theuser.id), notice: 'Successfully Updated'
    else
      render :edit, notice: 'Failed to Update'
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

  def page_6(obj, pg_name)
    obj.page(pg_name).reverse_order.per(6)
  end

  def page_8(obj, pg_name)
    obj.page(pg_name).reverse_order.per(8)
  end

end
