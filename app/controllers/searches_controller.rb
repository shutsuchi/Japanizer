class SearchesController < ApplicationController
  def search

    @keywords = params[:keyword]

    if @keyword.present?
      # フリーワード検索は未実装
      @results = []
      @keywords.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @results += Post.includes(:genres, :prefecture)
                        .where('genre.name LIKE(?) OR prefecture.name LIKE(?)', "%#{keyword}%", "%#{keyword}%")
      end
      @results.uniq!
    else
      @result_genre = Genre.find(params[:genre])
      @option = params[:option]
      @genre = params[:genre]
      @time = params[:time]
      @locale = params[:locale]
      if @option == "post_search"
        @posts = Post.params_post_search(@genre, @time, @locale)
      elsif @option == "album_search"
        @albums = Album.params_album_search(@genre, @time, @locale)
      end
    end

  end
end
