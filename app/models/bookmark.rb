# == Schema Information
#
# Table name: bookmarks
#
#  id       :bigint           not null, primary key
#  album_id :integer          not null
#  user_id  :integer          not null
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :album
end
