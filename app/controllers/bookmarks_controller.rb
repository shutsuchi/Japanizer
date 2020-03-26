class BookmarksController < ApplicationController
  def index
  end

  def create
    @album = find_album(params[:album_id])
    bookmark = current_user.bookmarks.new(album_id: @album.id)
    respond_to do |format|
      if bookmark.save!
        format.js
      end
    end
  end

  def destroy
    @album = find_album(params[:album_id])
    bookmark = current_user.bookmarks.find_by(album_id: @album.id)
    respond_to do |format|
      if bookmark.destroy!
        format.js
      end
    end
  end

  private

    def find_album(album_id)
      Album.find(album_id)
    end
end
