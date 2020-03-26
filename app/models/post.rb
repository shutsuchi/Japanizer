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
end
