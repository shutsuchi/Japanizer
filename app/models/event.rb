# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  allday     :string(255)
#  body       :text(65535)
#  end        :datetime
#  start      :datetime
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  genre_id   :integer          not null
#  user_id    :integer          not null
#
class Event < ApplicationRecord
  belongs_to :user
  belongs_to :genre
end
