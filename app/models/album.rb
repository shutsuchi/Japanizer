# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)
#  image         :string(255)
#  post_quantity :integer          not null
#  rate          :float(24)        default("0"), not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  plan_id       :integer          not null
#  user_id       :integer          not null
#
class Album < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :genre
  has_many :posts
  has_many :bookmarks
end
