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
