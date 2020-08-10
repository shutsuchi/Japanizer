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

  validates :title, presence: true,
                    length: { minimum: 1 }
  validates :comment, presence: true,
                      length: { minimum: 1 }

  scope :age_20, -> { where(users: {age: 1..20}) }
  scope :age_30, -> { where(users: {age: 20..30}) }
  scope :age_40, -> { where(users: {age: 30..40}) }
  scope :age_50, -> { where(users: {age: 40..50}) }
  scope :age_60, -> { where(users: {age: 50..60}) }
  scope :age_70, -> { where(users: {age: 60..70}) }
  scope :age_80, -> { where(users: {age: 70..80}) }

  scope :jp, -> { where(users: {country_code: 'JP'}) }
  scope :other, -> { where.not(users: {country_code: 'JP'}) }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def self.params_post_search(genre, time, nation)
    posts = Post.genre_search(genre, nation)
    if time == 'anytime_search'
      posts
    elsif time == 'year_search'
      day = Date.today
      start_day = day.prev_day(365)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == 'month_search'
      day = Date.today
      start_day = day.prev_day(30)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == 'week_search'
      day = Date.today
      start_day = day.prev_day(7)
      end_day = Time.now
      range = start_day.beginning_of_day..end_day
      posts.where(created_at: range)
    elsif time == 'day_search'
      end_day = Time.now
      range = Date.yesterday.beginning_of_day..end_day
      posts.where(created_at: range)
    end
  end

  def self.genre_search(genre, nation)
    if nation == 'JP'
      case genre
        when '1'
          Post.eager_load(:genre, :user).where(genre_id: 1).where(users: { country_code: 'JP' })
        when '2'
          Post.eager_load(:genre, :user).where(genre_id: 2).where(users: { country_code: 'JP' })
        when '3'
          Post.eager_load(:genre, :user).where(genre_id: 3).where(users: { country_code: 'JP' })
        when '4'
          Post.eager_load(:genre, :user).where(genre_id: 4).where(users: { country_code: 'JP' })
        when '5'
          Post.eager_load(:genre, :user).where(genre_id: 5).where(users: { country_code: 'JP' })
        when '6'
          Post.eager_load(:genre, :user).where(genre_id: 6).where(users: { country_code: 'JP' })
        when '7'
          Post.eager_load(:genre, :user).where(genre_id: 7).where(users: { country_code: 'JP' })
        when '8'
          Post.eager_load(:genre, :user).where(genre_id: 8).where(users: { country_code: 'JP' })
        when '9'
          Post.eager_load(:genre, :user).where(genre_id: 9).where(users: { country_code: 'JP' })
        when '10'
          Post.eager_load(:genre, :user).where(genre_id: 10).where(users: { country_code: 'JP' })
        else
          Post.eager_load(:user).where(users: { country_code: 'JP' })
      end
    else
      case genre
        when '1'
          Post.eager_load(:genre, :user).where(genre_id: 1).where.not(users: { country_code: 'JP' })
        when '2'
          Post.eager_load(:genre, :user).where(genre_id: 2).where.not(users: { country_code: 'JP' })
        when '3'
          Post.eager_load(:genre, :user).where(genre_id: 3).where.not(users: { country_code: 'JP' })
        when '4'
          Post.eager_load(:genre, :user).where(genre_id: 4).where.not(users: { country_code: 'JP' })
        when '5'
          Post.eager_load(:genre, :user).where(genre_id: 5).where.not(users: { country_code: 'JP' })
        when '6'
          Post.eager_load(:genre, :user).where(genre_id: 6).where.not(users: { country_code: 'JP' })
        when '7'
          Post.eager_load(:genre, :user).where(genre_id: 7).where.not(users: { country_code: 'JP' })
        when '8'
          Post.eager_load(:genre, :user).where(genre_id: 8).where.not(users: { country_code: 'JP' })
        when '9'
          Post.eager_load(:genre, :user).where(genre_id: 9).where.not(users: { country_code: 'JP' })
        when '10'
          Post.eager_load(:genre, :user).where(genre_id: 10).where.not(users: { country_code: 'JP' })
        else
          Post.eager_load(:user).where.not(users: { country_code: 'JP' })
      end
    end
  end
end
