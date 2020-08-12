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
end
