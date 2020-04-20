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
  end

  # GET budget/
  # budget_path
  def budget
    # 仮
    @range = params[:budget_range]
    case @range
    when '1'
      @albums_pg = pg(Album.where(bedget: '~ 1'))
    when '2'
      @albums_pg = pg(Album.where(budget: '1 ~ 3'))
    when '3'
      @albums_pg = pg(Album.where(budget: '3 ~ 5'))
    when '4'
      @albums_pg = pg(Album.where(budget: '5 ~ 7'))
    when '5'
      @albums_pg = pg(Album.where(budget: '7 ~ 9'))
    when '6'
      @albums_pg = pg(Album.where(budget: '10 ~ 20'))
    when '7'
      @albums_pg = pg(Album.where(budget: '20 ~ 30'))
    when '8'
      @albums_pg = pg(Album.where(budget: '30 ~ 40'))
    when '9'
      @albums_pg = pg(Album.where(budget: '40 ~ 50'))
    when '10'
      @albums_pg = pg(Album.where(budget: '50 ~'))
    else
      @albums_pg = pg(Album)
    end
  end

  # GET age/
  # age_path
  def age
    pg1 = params[:post]
    pg2 = params[:album]

    @range = params[:age_range]
    case @range
    when '1'
      @posts = page_8(Post.joins(:user).where("users.age = '1..20'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '1..20'"), pg2)
    when '2'
      @posts = page_8(Post.joins(:user).where("users.age = '20..30'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '20..30'"), pg2)
    when '3'
      @posts = page_8(Post.joins(:user).where("users.age = '30..40'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '30..40'"), pg2)
    when '4'
      @posts = page_8(Post.joins(:user).where("users.age = '40..50'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '40..50'"), pg2)
    when '5'
      @posts = page_8(Post.joins(:user).where("users.age = '50..60'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '50..60'"), pg2)
    when '6'
      @posts = page_8(Post.joins(:user).where("users.age = '60..70'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.age = '60..70'"), pg2)
    when '7'
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
    case @nation
    when '1'
      @posts = page_8(Post.joins(:user).where("users.country_code = 'JP'"), pg1)
      @albums = page_8(Album.joins(:user).where("users.country_code = 'JP'"), pg2)
    when '2'
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

  def page_8(obj, pg_name)
    obj.page(pg_name).reverse_order.per(8)
  end

  def find_genre(genre_id)
    return Genre.find(genre_id) if genre_id.present?
  end

end
