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
#  rate          :float(24)        default(0.0)
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
  has_many :bookmarks, dependent: :destroy

  attachment :image

  validates :title, presence: true, length: { minimum: 1 }
  validates :post_quantity, presence: true

  scope :budget_under, -> { where(budget: '~ 1') }
  scope :budget_3, -> { where(budget: '1 ~ 3') }
  scope :budget_5, -> { where(budget: '3 ~ 5') }
  scope :budget_7, -> { where(budget: '5 ~ 7') }
  scope :budget_9, -> { where(budget: '7 ~ 9') }
  scope :budget_20, -> { where(budget: '10 ~ 20') }
  scope :budget_30, -> { where(budget: '20 ~ 30') }
  scope :budget_40, -> { where(budget: '30 ~ 40') }
  scope :budget_50, -> { where(budget: '40 ~ 50') }
  scope :budget_over, -> { where(budget: '50 ~') }

  scope :age_20, -> { where(users: { age: 1..20 }) }
  scope :age_30, -> { where(users: { age: 20..30 }) }
  scope :age_40, -> { where(users: { age: 30..40 }) }
  scope :age_50, -> { where(users: { age: 40..50 }) }
  scope :age_60, -> { where(users: { age: 50..60 }) }
  scope :age_70, -> { where(users: { age: 60..70 }) }
  scope :age_80, -> { where(users: { age: 70..80 }) }

  scope :jp, -> { where(users: { country_code: 'JP' }) }
  scope :other, -> { where.not(users: { country_code: 'JP' }) }

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end

  def create_notification_bookmark!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and album_id = ? and action = ? ", current_user.id, user_id, id, 'bookmark'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        album_id: id,
        visited_id: user_id,
        action: 'bookmark'
      )
      if notification.visitor_id = notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def self.params_album_search(genre, time, nation)
    albums = Album.genre_search(genre, nation)
    if time == 'anytime_search'
      albums
    elsif time == 'year_search'
      day = Time.zone.today
      start_day = day.prev_day(365)
      end_day = Time.zone.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == 'month_search'
      day = Time.zone.today
      start_day = day.prev_day(30)
      end_day = Time.zone.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == 'week_search'
      day = Time.zone.today
      start_day = day.prev_day(7)
      end_day = Time.zone.now
      range = start_day.beginning_of_day..end_day
      albums.where(created_at: range)
    elsif time == 'day_search'
      end_day = Time.zone.now
      range = Date.yesterday.beginning_of_day..end_day
      albums.where(created_at: range)
    end
  end

  def self.genre_search(genre, nation)
    if nation == 'JP'
      case genre
      when '1'
        Album.eager_load(:genre, :user).where(genre_id: 1).where(users: { country_code: 'JP' })
      when '2'
        Album.eager_load(:genre, :user).where(genre_id: 2).where(users: { country_code: 'JP' })
      when '3'
        Album.eager_load(:genre, :user).where(genre_id: 3).where(users: { country_code: 'JP' })
      when '4'
        Album.eager_load(:genre, :user).where(genre_id: 4).where(users: { country_code: 'JP' })
      when '5'
        Album.eager_load(:genre, :user).where(genre_id: 5).where(users: { country_code: 'JP' })
      when '6'
        Album.eager_load(:genre, :user).where(genre_id: 6).where(users: { country_code: 'JP' })
      when '7'
        Album.eager_load(:genre, :user).where(genre_id: 7).where(users: { country_code: 'JP' })
      when '8'
        Album.eager_load(:genre, :user).where(genre_id: 8).where(users: { country_code: 'JP' })
      when '9'
        Album.eager_load(:genre, :user).where(genre_id: 9).where(users: { country_code: 'JP' })
      when '10'
        Album.eager_load(:genre, :user).where(genre_id: 10).where(users: { country_code: 'JP' })
      else
        Album.eager_load(:user).where(users: { country_code: 'JP' })
      end
    elsif nation == 'Others'
      case genre
      when '1'
        Album.eager_load(:genre, :user).where(genre_id: 1).where.not(users: { country_code: 'JP' })
      when '2'
        Album.eager_load(:genre, :user).where(genre_id: 2).where.not(users: { country_code: 'JP' })
      when '3'
        Album.eager_load(:genre, :user).where(genre_id: 3).where.not(users: { country_code: 'JP' })
      when '4'
        Album.eager_load(:genre, :user).where(genre_id: 4).where.not(users: { country_code: 'JP' })
      when '5'
        Album.eager_load(:genre, :user).where(genre_id: 5).where.not(users: { country_code: 'JP' })
      when '6'
        Album.eager_load(:genre, :user).where(genre_id: 6).where.not(users: { country_code: 'JP' })
      when '7'
        Album.eager_load(:genre, :user).where(genre_id: 7).where.not(users: { country_code: 'JP' })
      when '8'
        Album.eager_load(:genre, :user).where(genre_id: 8).where.not(users: { country_code: 'JP' })
      when '9'
        Album.eager_load(:genre, :user).where(genre_id: 9).where.not(users: { country_code: 'JP' })
      when '10'
        Album.eager_load(:genre, :user).where(genre_id: 10).where.not(users: { country_code: 'JP' })
      else
        Album.eager_load(:user).where.not(users: { country_code: 'JP' })
      end
    else
      Album.all
    end
  end
end
