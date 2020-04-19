class GenresController < ApplicationController

  # GET genres/
  # genres_path
  def index
    @genres = Genre.where.not(id: 1)

    @genre_post_ranks = Genre.find(Post.group(:genre_id)
                                      .where.not(genre_id: 1)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    pg1 = params[:post]
    pg2 = params[:album]

    if find_genre(params[:id])
      genre = find_genre(params[:id])
      genre.id = params[:id]

      @posts_pg = page_8(genre.posts, pg1)
      @albums_pg = page_8(genre.albums, pg2)
    else
      @posts_pg = page_8(Post, pg1)
      @albums_pg = page_8(Album, pg2)
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
      @albums_pg = pg(Album.where(bedget: "~ 1"))
    elsif @range == "2"
      @albums_pg = pg(Album.where(budget: "1 ~ 3"))
    elsif @range == "3"
      @albums_pg = pg(Album.where(budget: "3 ~ 5"))
    elsif @range == "4"
      @albums_pg = pg(Album.where(budget: "5 ~ 7"))
    elsif @range == "5"
      @albums_pg = pg(Album.where(budget: "7 ~ 9"))
    elsif @range == "6"
      @albums_pg = pg(Album.where(budget: "10 ~ 20"))
    elsif @range == "7"
      @albums_pg = pg(Album.where(budget: "20 ~ 30"))
    elsif @range == "8"
      @albums_pg = pg(Album.where(budget: "30 ~ 40"))
    elsif @range == "9"
      @albums_pg = pg(Album.where(budget: "40 ~ 50"))
    elsif @range == "10"
      @albums_pg = pg(Album.where(budget: "50 ~"))
    else
      @albums_pg = pg(Album)
    end
  end

  def age
    pg1 = params[:post]
    pg2 = params[:album]

    @range = params[:age_range]
    if @range == "1"
      @posts = page_8(Post.joins(:user).where("users.age = '1..20'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '1..20'"), pg2)
    elsif @range == "2"
      @posts = page_8(Post.joins(:user).where("users.age = '20..30'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '20..30'"), pg2)
    elsif @range == "3"
      @posts = page_8(Post.joins(:user).where("users.age = '30..40'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '30..40'"), pg2)
    elsif @range == "4"
      @posts = page_8(Post.joins(:user).where("users.age = '40..50'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '40..50'"), pg2)
    elsif @range == "5"
      @posts = page_8(Post.joins(:user).where("users.age = '50..60'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '50..60'"), pg2)
    elsif @range == "6"
      @posts = page_8(Post.joins(:user).where("users.age = '60..70'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '60..70'"), pg2)
    elsif @range == "7"
      @posts = page_8(Post.joins(:user).where("users.age = '70..80'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '70..80'"), pg2)
    else
      @posts = page_8(Post, pg1)
      @albums = page_8(Album, pg2)
    end
  end

  # GET nation/
  # nation_path
  def nation
    pg1 = params[:post]
    pg2 = params[:album]

    @nation = params[:nation]
    if @nation == "1"
      @posts = page_8(Post.joins(:user).where("users.country_code = 'JP'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.country_code = 'JP'"), pg2)
    elsif @nation == "2"
      @posts = page_8(Post.joins(:user).where.not("users.country_code = 'JP'"), pg1)
      @albums = page_8(Album.joins(:user).where.not("users.country_code = 'JP'"), pg2)
    else
      @posts = page_8(Post, pg1)
      @albums = page_8(Album, pg2)
    end
  end


  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def pg(obj)
      obj.page(params[:page]).reverse_order.per(8)
    end
    def page_8(obj, pg)
      obj.page(pg).reverse_order.per(8)
    end
    def find_genre(genre_id)
      return Genre.find(genre_id) if genre_id.present?
    end
end
