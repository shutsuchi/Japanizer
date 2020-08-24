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
FactoryBot.define do
  factory :event do
    genre
    user
    title { 'lunch' }
    body  { 'coding' }
    start { 'Sat, 16 Aug 2019 12:09:17 UTC +00:00' }
  end
  factory :another_event, class: Event do
    genre
    user
    title { 'dinner' }
    body  { 'coding' }
    start { 'Sat, 15 Aug 2020 08:09:17 UTC +00:00' }
  end
end
