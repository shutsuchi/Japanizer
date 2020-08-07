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
