FactoryBot.define do
  factory :postComment do
    user
    post
    comment { 'cool!' }
    rate    { 5 }
    title   { 'nice' }
  end
end
