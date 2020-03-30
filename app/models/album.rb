# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)
#  post_quantity :integer          default("0"), not null
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  user_id       :integer          not null
#
class Album < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :posts
  has_many :bookmarks

  attachment :image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end


  def self.params_album_search(genre, time)
    albums = Album.genre_search(genre)
    if time == "anytime_search"
      albums
    elsif time == "year_search"
      day = Date.today
      start_day = day.prev_day(365)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == "month_search"
      day = Date.today
      start_day = day.prev_day(30)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == "week_search"
      day = Date.today
      start_day = day.prev_day(7)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == "day_search"
      end_day = Time.now
      range = Date.yesterday.beginning_of_day..end_day
      albums.where(created_at: range)
    end
  end

  def self.genre_search(genre)
    case genre
      when "1"
        album.includes(:genre).where(genre_id: 1)
      when "2"
        album.includes(:genre).where(genre_id: 2)
      when "3"
        album.includes(:genre).where(genre_id: 3)
      when "4"
        album.includes(:genre).where(genre_id: 4)
      when "5"
        album.includes(:genre).where(genre_id: 5)
      when "6"
        album.includes(:genre).where(genre_id: 6)
      when "7"
        album.includes(:genre).where(genre_id: 7)
      when "8"
        album.includes(:genre).where(genre_id: 8)
      when "9"
        album.includes(:genre).where(genre_id: 9)
      when "10"
        album.includes(:genre).where(genre_id: 10)
      when nil
        album.all
    end
  end
end
