# == Schema Information
#
# Table name: posts
#
#  id            :bigint           not null, primary key
#  comment       :text(65535)      not null
#  rate          :float(24)        default(0.0)
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
FactoryBot.define do
  factory :post do
    user
    prefecture
    city
    genre
    album
    title         { 'Japan Tour' }
    comment       { 'nice' }
    rate          { 4 }
  end

  factory :another_post, class: Post do
    user
    prefecture
    city
    genre
    album
    title   { 'awesome' }
    comment { 'yeah' }
    rate    { 3 }
  end
end
