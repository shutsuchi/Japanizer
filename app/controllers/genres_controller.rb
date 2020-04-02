class GenresController < ApplicationController

  # GET genres/
  # genres_path
  def index
    @genres = Genre.where.not(id: 1).all
    @posts = page(Post)
    @albums = page(Album)
    # ランキング
    # genre 投稿ランキング
    @genre_post_ranks = Genre.find(Post.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # genre アルバムランキング
    @genre_album_ranks = Genre.find(Album.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # post Like数ランキング
    @post_like_ranks = Post.find(Like.group(:post_id)
                                    .order('count(post_id) desc')
                                    .limit(5)
                                    .pluck(:post_id))
    # post Comment数ランキング
    @post_comment_ranks = Post.find(PostComment.group(:post_id)
                                              .order('count(post_id) desc')
                                              .limit(5)
                                              .pluck(:post_id))
    # album Bookmark数ランキング
    @album_bookmark_ranks = Album.find(Bookmark.group(:album_id)
                                      .order('count(album_id) desc')
                                      .limit(5)
                                      .pluck(:album_id))
    # genre選択時、表示されている投稿とアルバムを
    # 選択されたgenreに紐づく対象に変更
    if find_genre(params[:id])
      genre = find_genre(params[:id])
      genre.id = params[:id]
      @post_like_genre_ranks = genre.posts.find(Like.group(:post_id)
                                                    .order('count(post_id) desc')
                                                    .limit(5)
                                                    .pluck(:post_id))
      @post_comment_genre_ranks = genre.posts.find(PostComment.group(:post_id)
                                                            .order('count(post_id) desc')
                                                            .limit(5)
                                                            .pluck(:post_id))
      @album_bookmark_genre_ranks = genre.albums.find(Bookmark.group(:album_id)
                                                            .order('count(album_id) desc')
                                                            .limit(5)
                                                            .pluck(:album_id))
    end
  end

  def price
    #仮
    #if params[:age] == 1
    #@album = Album.where(budget: <2)
  end

  def age
    #@posts = Post.includes(:users).where(user.age: 1..10)
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
