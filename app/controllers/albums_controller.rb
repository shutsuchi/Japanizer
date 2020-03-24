class AlbumsController < ApplicationController
  def index
    @album = Album.new
    @albums_pg = Album.page(params[:page]).reverse_order.per(8)
    @user_albums_pg = current_user.albums.page(params[:page]).reverse_order.per(4)
    @user_no_posts = Post.where(album_id: current_user.albums.first.id)
  end

  def show
    @thealbum = find_album(params[:id])

  end

  def edit
    @thealbum = find_album(params[:id])
    @userposts = current_user.posts
  end

  def create
    album = Album.new(album_params)
    album.user_id = current_user.id
    if album.save
        c = 0
        post_quantity = params[:album][:post_quantity].count
        while c <= post_quantity
          post = find_post(params[:album][:post_quantity][c].to_i)
          # album_id がないって怒られてエラーです。
          post.update(album_id: album.id)
          (c += 1)
        end
      redirect_to :show
    end
  end

  def update
    thealbum = find_album(params[:id])
    thealbum.post_quantity = params[:album][:post_quantity].count
    c = 0
    if thealbum.update(album_params)
        # album更新時に選択した投稿をalbum_id情報を付加して更新
        while count <= thealbum.post_quantity do
          (c += 1)
          post_id = params[:album][:post_quantity][c]
          post = Post.find_by(id: post_id)
          # album_id が nil になって、エラーが発生している。
          post.album_id = thealbum.id
          post.save
        end
      redirect_to thealbum
    end
  end

  def destroy
    thealbum = find_album(params[:id])
    posts = Post.where(album_id: thealbum.id)
    # 削除対象のアルバムに紐づいていた投稿のアルバムIDを未決アルバムのIDに変更
    posts.each do |post|
      post.update(album_id: current_user.album.first.id)
    end
    if thealbum.destroy
      redirect_to albums_path
    end
  end

  private
  def album_params
    params.require(:album).permit(:user_id, :genre_id, :title, :image_id, :post_quantity, :comment, :rate)
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
