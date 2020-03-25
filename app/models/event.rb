# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  budget      :string(255)
#  description :text(65535)
#  end_date    :datetime
#  mean        :string(255)
#  memo        :string(255)
#  people      :integer
#  start_date  :datetime
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :integer          not null
#  user_id     :integer          not null
#
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
end