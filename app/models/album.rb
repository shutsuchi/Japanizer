# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  budget        :string(255)
#  comment       :text(65535)
#  mean          :string(255)
#  people        :integer
#  post_quantity :integer          default(0), not null
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

  validates :title, presence: true,
                   length: { minimum: 1 }
  validates :post_quantity, presence: true
  validates :rate, presence: true

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end


  def self.params_album_search(genre, time, locale)
    albums = Album.genre_search(genre, locale)
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

  def self.genre_search(genre, locale)
    if locale == "JP"
      case genre
        when "1"
          Album.includes(:genre, :user).where(genre_id: 1).where('users.country_code' => 'JP')
        when "2"
          Album.includes(:genre, :user).where(genre_id: 2).where('users.country_code' => 'JP')
        when "3"
          Album.includes(:genre, :user).where(genre_id: 3).where('users.country_code' => 'JP')
        when "4"
          Album.includes(:genre, :user).where(genre_id: 4).where('users.country_code' => 'JP')
        when "5"
          Album.includes(:genre, :user).where(genre_id: 5).where('users.country_code' => 'JP')
        when "6"
          Album.includes(:genre, :user).where(genre_id: 6).where('users.country_code' => 'JP')
        when "7"
          Album.includes(:genre, :user).where(genre_id: 7).where('users.country_code' => 'JP')
        when "8"
          Album.includes(:genre, :user).where(genre_id: 8).where('users.country_code' => 'JP')
        when "9"
          Album.includes(:genre, :user).where(genre_id: 9).where('users.country_code' => 'JP')
        when "10"
          Album.includes(:genre, :user).where(genre_id: 10).where('users.country_code' => 'JP')
        when nil
          Album.includes(:user).where('users.country_code' => 'JP')
      end
    else
      case genre
        when "1"
          Album.includes(:genre, :user).where(genre_id: 1).where.not('users.country_code' => 'JP')
        when "2"
          Album.includes(:genre, :user).where(genre_id: 2).where.not('users.country_code' => 'JP')
        when "3"
          Album.includes(:genre, :user).where(genre_id: 3).where.not('users.country_code' => 'JP')
        when "4"
          Album.includes(:genre, :user).where(genre_id: 4).where.not('users.country_code' => 'JP')
        when "5"
          Album.includes(:genre, :user).where(genre_id: 5).where.not('users.country_code' => 'JP')
        when "6"
          Album.includes(:genre, :user).where(genre_id: 6).where.not('users.country_code' => 'JP')
        when "7"
          Album.includes(:genre, :user).where(genre_id: 7).where.not('users.country_code' => 'JP')
        when "8"
          Album.includes(:genre, :user).where(genre_id: 8).where.not('users.country_code' => 'JP')
        when "9"
          Album.includes(:genre, :user).where(genre_id: 9).where.not('users.country_code' => 'JP')
        when "10"
          Album.includes(:genre, :user).where(genre_id: 10).where.not('users.country_code' => 'JP')
        when nil
          Album.includes(:user).where.not('users.country_code' => 'JP')
      end
    end
  end
end
