# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :posts
  has_many :plans
  has_many :albums
end