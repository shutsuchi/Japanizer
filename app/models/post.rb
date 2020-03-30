# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)      not null
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  album_id      :integer          not null
#  city_id       :integer          not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  prefecture_id :integer          not null
#  user_id       :integer          not null
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :prefecture
  belongs_to :city
  belongs_to :genre
  belongs_to :album
  has_many :likes
  has_many :post_comments

  attachment :image

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.params_post_search(genre, time)
    posts = Post.genre_search(genre)
    if time == "anytime_search"
      posts
    elsif time == "year_search"
      day = Date.today
      start_day = day.prev_day(365)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == "month_search"
      day = Date.today
      start_day = day.prev_day(30)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == "week_search"
      day = Date.today
      start_day = day.prev_day(7)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == "day_search"
      end_day = Time.now
      range = Date.yesterday.beginning_of_day..end_day
      posts.where(created_at: range)
    end
  end

  def self.genre_search(genre)
    case genre
      when "1"
        Post.includes(:genre).where(genre_id: 1)
      when "2"
        Post.includes(:genre).where(genre_id: 2)
      when "3"
        Post.includes(:genre).where(genre_id: 3)
      when "4"
        Post.includes(:genre).where(genre_id: 4)
      when "5"
        Post.includes(:genre).where(genre_id: 5)
      when "6"
        Post.includes(:genre).where(genre_id: 6)
      when "7"
        Post.includes(:genre).where(genre_id: 7)
      when "8"
        Post.includes(:genre).where(genre_id: 8)
      when "9"
        Post.includes(:genre).where(genre_id: 9)
      when "10"
        Post.includes(:genre).where(genre_id: 10)
      when nil
        Post.all
    end
  end
end
