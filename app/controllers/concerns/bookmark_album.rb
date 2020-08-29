module BookmarkAlbum
  extend ActiveSupport::Concern

  def bookmark_album
    user = current_user
    c = user.bookmarks.count
    i = 0
    albums = []
    while i < c
      user.bookmarks.each do |bookmark|
        albums[i] = bookmark.album
        i += 1
      end
    end
    albums
  end
end
