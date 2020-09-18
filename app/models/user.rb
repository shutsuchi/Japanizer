# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  age                    :integer          not null
#  country_code           :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  state_code             :string(255)
#  withdrawal_flag        :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_id               :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy, inverse_of: :visitor
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy, inverse_of: :visited

  attachment :image

  validates :name, presence: true, length: { in: 1..50 }
  validates :age, presence: true
  validates :country_code, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true # format: { with: VALID_EMAIL_REGEX, allow_blank: true }
  validates :withdrawal_flag, inclusion: { in: [true, false] }
  validates :admin, inclusion: { in: [true, false] }

  scope :age_20, -> { where("users.age > ?', '1..20'") }
  scope :age_30, -> { where("users.age > ?', '20..30'") }
  scope :age_40, -> { where("users.age > ?', '30..40'") }
  scope :age_50, -> { where("users.age > ?', '40..50'") }
  scope :age_60, -> { where("users.age > ?', '50..60'") }
  scope :age_70, -> { where("users.age > ?', '60..70'") }
  scope :age_80, -> { where("users.age > ?', '70..80'") }

end
