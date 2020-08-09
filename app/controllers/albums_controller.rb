class AlbumsController < ApplicationController

  include Page

  # GET /albums
  # albums_path
  def index
    @album = Album.new

    pg1 = params[:user]
    pg2 = params[:other]

    if current_user.nil?
      @albums_pg = Album.page(params[:page]).order(created_at: :desc).per(6)
    else
      # User's Empty Album
      @user_no_posts = Post.where(album_id: current_user.albums.first.id)

      if params[:user]
        pg1 = params[:user]
        # Current_user's Album
        @user_albums_pg = type_page_6(current_user.albums, pg1)
      else
        @user_albums_pg = page_6(current_user.albums)
      end
      if params[:other]
        pg2 = params[:other]
        # Other User's Album
        @others_albums_pg = type_page_6(Album.includes(:user).where.not(user_id: current_user.id), pg2)
      else
        @others_albums_pg = page_6(Album.includes(:user).where.not(user_id: current_user.id))
      end
    end
  end

  # GET /album/:id
  # album_path
  def show
    @thealbum = find_album(params[:id])
    @posts = page_8(@thealbum.posts)
  end

  # GET /album/:id/edit
  # edit_album_path
  def edit
    if current_user.present?
      @thealbum = find_album(params[:id])
      @user_posts = current_user.posts
      if current_user != @thealbum.user
        redirect_to top_path
      end
    else
      redirect_to top_path
    end
  end

  # POST /albums
  # albums_path
  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    @album.album_create_rate

    if @album.save
      redirect_to @album
    else
      @album = Album.new
      # User's Empty Album
      @user_no_posts = Post.where(album_id: current_user.albums.first.id)

      pg1 = params[:user]
      pg2 = params[:other]
      @user_albums_pg = type_page_6(current_user.albums, pg1)
      @others_albums_pg = type_page_6(Album.includes(:user)
                                      .where.not(user_id: current_user.id), pg2)
      render :index
    end
  end

  # PATCH /albums/:id
  # album_path
  def update
    @thealbum = find_album(params[:id])

    if @thealbum.update(
      genre_id: params[:album][:genre_id],
      image: params[:album][:image],
      title: params[:album][:title],
      comment: params[:album][:comment],
      post_quantity: @thealbum.post_quantity_update,
      rate: @thealbum.rate_update
      )
      # Update album_id of post selected when album update
      @thealbum.album_update_post
      redirect_to @thealbum
    else
      @user_posts = current_user.posts
      render :edit
    end
  end

  def destroy
    thealbum = find_album(params[:id])
    posts = Post.where(album_id: thealbum.id)
    
    # Change Album_id post attached Deleted Album
    # Into id of undefined album
    if thealbum.destroy
      posts.each do |post|
        post.update(album_id: current_user.albums.first.id)
      end
    end

    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:user_id,
                                  :genre_id,
                                  :title,
                                  :image,
                                  :post_quantity,
                                  :comment,
                                  :rate,
                                  :budget,
                                  :mean,
                                  :people)
  end

  def post_params
    params.require(:post).permit(:album_id)
  end

  def find_album(album_id)
    Album.find(album_id)
  end

  def find_post(post_id)
    Post.find(post_id)
  end

end
