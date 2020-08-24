# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  en_name    :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Genre < ApplicationRecord
  has_many :posts
  has_many :events
  has_many :albums
end
