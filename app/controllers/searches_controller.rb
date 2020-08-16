class SearchesController < ApplicationController

  # GET /searches
  # searches_path
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
        @result_genre = t('searches.any_genre')
      end

      @option = params[:option]
      @genre = params[:genre]
      @time = params[:time]
      @nation = params[:nation]
      if @option == 'post_search'
        @posts = Post.params_post_search(@genre, @time, @nation)
      elsif @option == 'album_search'
        @albums = Album.params_album_search(@genre, @time, @nation)
      end
    end

  end
end
