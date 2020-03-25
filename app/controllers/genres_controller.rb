class GenresController < ApplicationController

  # GET genres/
  # genres_path
  def index
    @genres = page(Genre)
    @posts = page(Post)
    @albums = page(Album)
    # genre選択時、表示されている投稿とアルバムを
    # 選択されたgenreに紐づく対象に変更
    if find_genre(params[:id])
      genre = find_genre(params[:id])
      genre.id = params[:id]
      @pickgenre_posts = genre.posts.page(params[:id]).reverse_order.per(8)
      @pickgenre_albums = genre.albums.page(params[:id]).reverse_order.per(8)
    end
    # ランキング
    #@post_like_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    #@post_comment_ranks = Post.find(PostComment.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    #@album_ranks = Album.find(Bookmark.group(:album_id).order('count(album_id) desc').limit(5).pluck(:album_id))
  end

  # POST genres/
  # genres_path
  def create
  end

  # PATCH genres/:id
  # genre_path
  def update
  end

  # DELETE genres/:id
  # genre_path
  def destroy
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def page(obj)
      obj.page(params[:page]).reverse_order.per(8)
    end
    def find_genre(genre_id)
      return Genre.find(genre_id) if genre_id.present?
    end
end
