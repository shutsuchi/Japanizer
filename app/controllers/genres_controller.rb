class GenresController < ApplicationController
  include Page
  include GenreChoice

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

      @posts_pg = type_page_8(genre.posts, pg1)
      @albums_pg = type_page_8(genre.albums, pg2)
    else
      @posts_pg = type_page_8(Post, pg1)
      @albums_pg = type_page_8(Album, pg2)
    end
  end

  # GET budget/
  # budget_path
  def budget
    # 仮
    @range = params[:budget_range]
    @albums_pg = budget_album(@range)
  end

  # GET age/
  # age_path
  def age
    pg1 = params[:post]
    pg2 = params[:album]

    @range = params[:age_range]
    @posts_pg = age_post(@range, pg1)
    @albums_pg = age_album(@range, pg2)
  end

  # GET nation/
  # nation_path
  def nation
    pg1 = params[:post]
    pg2 = params[:album]

    @nation = params[:nation]
    case @nation
    when '1'
      @posts_pg = type_page_8(Post.joins(:user).jp, pg1)
      @albums_pg = type_page_6(Album.joins(:user).jp, pg2)
    when '2'
      @posts_pg = type_page_8(Post.joins(:user).other, pg1)
      @albums_pg = type_page_6(Album.joins(:user).other, pg2)
    else
      @posts_pg = type_page_8(Post, pg1)
      @albums_pg = type_page_6(Album, pg2)
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre(genre_id)
    return Genre.find(genre_id) if genre_id.present?
  end

end
