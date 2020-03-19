# == Schema Information
#
# Table name: plans
#
#  id         :bigint           not null, primary key
#  budget     :string(255)      not null
#  first_date :date             not null
#  last_date  :date             not null
#  mean       :string(255)      not null
#  memo       :string(255)
#  people     :integer
#  purpose    :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer          not null
#  user_id    :integer          not null
#
class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :albums
end
