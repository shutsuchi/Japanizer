# == Schema Information
#
# Table name: albums
#
#  id            :bigint           not null, primary key
#  budget        :string(255)
#  comment       :text(65535)
#  mean          :string(255)
#  people        :integer
#  post_quantity :integer          default(0), not null
#  rate          :float(24)        not null
#  title         :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  genre_id      :integer          not null
#  image_id      :string(255)
#  user_id       :integer          not null
#
FactoryBot.define do
  factory :album do
    id         { 1 }
    title      { 'Japan Tour' }
    rate       { 4 }
    created_at { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at { 'Thu, 06 Aug 2020 21:40:24 +0000' }
    genre_id   { 1 }
    user_id    { 1 }
    genre
  end
end
