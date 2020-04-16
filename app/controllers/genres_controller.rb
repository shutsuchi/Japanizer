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

    if find_genre(params[:id])
      genre = find_genre(params[:id])
      genre.id = params[:id]
      @genre_post = genre.posts
      @genre_album = genre.albums
    end
    #@genres = Genre.where.not(id: 1).all
    #@posts = page(Post)
    #@albums = page(Album)
    ## ランキング
    ## genre 投稿ランキング
    #@genre_post_ranks = Genre.find(Post.group(:genre_id)
    #                                  .order('count(genre_id) desc')
    #                                  .pluck(:genre_id))
    ## genre アルバムランキング
    #@genre_album_ranks = Genre.find(Album.group(:genre_id)
    #                                  .order('count(genre_id) desc')
    #                                  .pluck(:genre_id))
    ## post Like数ランキング
    #@post_like_ranks = Post.find(Like.group(:post_id)
    #                                .order('count(post_id) desc')
    #                                .limit(5)
    #                                .pluck(:post_id))
    ## post Comment数ランキング
    #@post_comment_ranks = Post.find(PostComment.group(:post_id)
    #                                          .order('count(post_id) desc')
    #                                          .limit(5)
    #                                          .pluck(:post_id))
    ## album Bookmark数ランキング
    #@album_bookmark_ranks = Album.find(Bookmark.group(:album_id)
    #                                  .order('count(album_id) desc')
    #                                  .limit(5)
    #                                  .pluck(:album_id))
    ## genre選択時、表示されている投稿とアルバムを
    ## 選択されたgenreに紐づく対象に変更
    #if find_genre(params[:id])
    #  genre = find_genre(params[:id])
    #  genre.id = params[:id]
    #  @post_like_genre_ranks = genre.posts.find(Like.group(:post_id)
    #                                                .order('count(post_id) desc')
    #                                                .limit(5)
    #                                                .pluck(:post_id))
    #  @post_comment_genre_ranks = genre.posts.find(PostComment.group(:post_id)
    #                                                        .order('count(post_id) desc')
    #                                                        .limit(5)
    #                                                        .pluck(:post_id))
    #  @album_bookmark_genre_ranks = genre.albums.find(Bookmark.group(:album_id)
    #                                                        .order('count(album_id) desc')
    #                                                        .limit(5)
    #                                                        .pluck(:album_id))
    #end
  end

  def budget
    # 仮
    @range = params[:budget_range]
    if @range == "1"
      @albums = page(Album.where(bedget: "~ 1"))
    elsif @range == "2"
      @albums = page(Album.where(budget: "1 ~ 3"))
    elsif @range == "3"
      @albums = page(Album.where(budget: "3 ~ 5"))
    elsif @range == "4"
      @albums = page(Album.where(budget: "5 ~ 7"))
    elsif @range == "5"
      @albums = page(Album.where(budget: "7 ~ 9"))
    elsif @range == "6"
      @albums = page(Album.where(budget: "10 ~ 20"))
    elsif @range == "7"
      @albums = page(Album.where(budget: "20 ~ 30"))
    elsif @range == "8"
      @albums = page(Album.where(budget: "30 ~ 40"))
    elsif @range == "9"
      @albums = page(Album.where(budget: "40 ~ 50"))
    elsif @range == "10"
      @albums = page(Album.where(budget: "50 ~"))
    else
      @albums = page(Album.all)
    end
  end

  def age
    @range = params[:age_range]
    if @range == "1"
      @posts = page(Post.joins(:user).where("users.age = '1..20'"))
      @albums = page(Album.joins(:user).where("users.age = '1..20'"))
    elsif @range == "2"
      @posts = page(Post.joins(:user).where("users.age = '20..30'"))
      @albums = page(Album.joins(:user).where("users.age = '20..30'"))
    elsif @range == "3"
      @posts = page(Post.joins(:user).where("users.age = '30..40'"))
      @albums = page(Album.joins(:user).where("users.age = '30..40'"))
    elsif @range == "4"
      @posts = page(Post.joins(:user).where("users.age = '40..50'"))
      @albums = page(Album.joins(:user).where("users.age = '40..50'"))
    elsif @range == "5"
      @posts = page(Post.joins(:user).where("users.age = '50..60'"))
      @albums = page(Album.joins(:user).where("users.age = '50..60'"))
    elsif @range == "6"
      @posts = page(Post.joins(:user).where("users.age = '60..70'"))
      @albums = page(Album.joins(:user).where("users.age = '60..70'"))
    elsif @range == "7"
      @posts = page(Post.joins(:user).where("users.age = '70..80'"))
      @albums = page(Album.joins(:user).where("users.age = '70..80'"))
    else
      @posts = page(Post.all)
      @albums = page(Album.all)
    end
  end

  # GET nation/
  # nation_path
  def nation
    @nation = params[:nation]
    if @nation == "1"
      @posts = page(Post.joins(:user).where("users.country_code = 'JP'"))
      @albums = page(Album.joins(:user).where("users.country_code = 'JP'"))
    elsif @nation == "2"
      @posts = page(Post.joins(:user).where.not("users.country_code = 'JP'"))
      @albums = page(Album.joins(:user).where.not("users.country_code = 'JP'"))
    else
      @posts = page(Post.all)
      @albums = page(Album.all)
    end
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
