class GenresController < ApplicationController
  include Page
  include GenreChoice

  # GET genres/
  # genres_path
  def index
    @genres = Genre.where.not(id: 1)

    @genre_post_ranks = Genre.find(Post.group(:genre_id)
                                      .where.not(genre_id: 1)
                                      .order(Arel.sql('count(genre_id) desc'))
                                      .pluck(:genre_id))

    if params[:id].present?
      genre = find_genre(params[:id])
      if params[:post].present?
        pg1 = params[:post]
        @posts_pg = type_page_8(genre.posts, pg1)
      else
        @posts_pg = page_8(genre.posts)
      end
      if params[:album].present?
        pg2 = params[:album]
        @albums_pg = type_page_6(genre.albums, pg2)
      else
        @albums_pg = page_6(genre.albums)
      end
    else
      if params[:post].present?
        pg1 = params[:post]
        @posts_pg = type_page_8(Post, pg1)
      else
        @posts_pg = page_8(Post)
      end
      if params[:album].present?
        pg2 = params[:album]
        @albums_pg = type_page_6(Album, pg2)
      else
        @albums_pg = page_6(Album)
      end
    end
  end

  # GET budget/
  # budget_path
  def budget
    if params[:budget_range].present?
      @range = params[:budget_range]
      @albums_pg = budget_album(@range)
    else
      @albums_pg = page_6(Album)
    end
  end

  # GET age/
  # age_path
  def age
    if params[:age_range].present?
      @range = params[:age_range]
      if params[:post].present?
        pg1 = params[:post]
        @posts_pg = age_post_pg(@range, pg1)
      else
        @posts_pg = age_post(@range)
      end
      if params[:album].present?
        pg2 = params[:album]
        @albums_pg = age_album_pg(@range, pg2)
      else
        @albums_pg = age_album(@range)
      end
    else
      @posts_pg = page_8(Post)
      @albums_pg = page_6(Album)
    end

  end

  # GET nation/
  # nation_path
  def nation
    if params[:nation].present?
      @nation = params[:nation]
      # jp or other
      case @nation
      when '1'
        # this is for pagination
        if params[:post].present?
          pg1 = params[:post]
          @posts_pg = type_page_8(Post.eager_load(:user).jp, pg1)
        else
          @posts_pg = page_8(Post.eager_load(:user).jp)
        end
        if params[:album].present?
          pg2 = params[:album]
          @albums_pg = type_page_6(Album.eager_load(:user).jp, pg2)
        else
          @albums_pg = page_6(Album.eager_load(:user).jp)
        end
      when '2'
        if params[:post].present?
          pg1 = params[:post]
          @posts_pg = type_page_8(Post.eager_load(:user).other, pg1)
        else
          @posts_pg = page_8(Post.eager_load(:user).other)
        end
        if params[:album].present?
          pg2 = params[:album]
          @albums_pg = type_page_6(Album.eager_load(:user).other, pg2)
        else
          @albums_pg = page_6(Album.eager_load(:user).other)
        end
      end
    else
      @posts_pg = page_8(Post)
      @albums_pg = page_6(Album)
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def find_genre(genre_id)
    Genre.find(genre_id) if genre_id.present?
  end

end
