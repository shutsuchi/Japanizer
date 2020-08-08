FactoryBot.define do
  factory :post do
    id            { 1 }
    title         { 'Japan Tour' }
    comment       { 'nice' }
    rate          { 4 }
    created_at    { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at    { 'Thu, 06 Aug 2020 21:40:24 +0000' }
    album_id      { 1 }
    city_id       { 1 }
    prefecture_id { 1 }
    genre_id      { 1 }
    user_id       { 1 }
    prefecture
    city
    genre
    album
  end
end
