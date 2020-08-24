# == Schema Information
#
# Table name: bookmarks
#
#  id       :bigint           not null, primary key
#  album_id :integer          not null
#  user_id  :integer          not null
#
FactoryBot.define do
  factory :bookmark do
    user
    album
  end
end
