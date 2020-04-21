class SearchesController < ApplicationController

  def search

    @keywords = params[:keyword]

    if @keyword.present?
      # Plan to add Free-Word search
      # @results = []
      # @keywords.split(/[[:blank:]]+/).each do |keyword|
      #   next if keyword == ''

      #   @results += Post.includes(:genres, :prefecture)
      #                   .where('genre.name LIKE(?) OR prefecture.name LIKE(?)', "%#{keyword}%", "%#{keyword}%")
      # end
      # @results.uniq!
    else
      if params[:genre] =~ /\A[0-9]+\z/
        @result_genre = Genre.find(params[:genre])
      else
        @result_genre = 'All'
      end

      @option = params[:option]
      @genre = params[:genre]
      @time = params[:time]
      @locale = params[:locale]
      if @option == 'post_search'
        @posts = Post.params_post_search(@genre, @time, @locale)
      elsif @option == 'album_search'
        @albums = Album.params_album_search(@genre, @time, @locale)
      end
    end

  end
end
