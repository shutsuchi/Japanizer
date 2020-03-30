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
      option = params[:option]
      genre = params[:genre]
      time = params[:time]
      if option == "post_search"
        @posts = Post.params_post_search(genre, time)
      elsif option == "album_search"
        @albums = Album.prams_album_search(genre, time)
      end
    end

  end
end
