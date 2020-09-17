class AddAlbumIdToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :album_id, :integer
  end
end
