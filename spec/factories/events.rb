FactoryBot.define do
  factory :event do
    genre
    user
    title { 'lunch' }
    body  { 'coding' }
    start { 'Sat, 16 Aug 2019 12:09:17 +0000' }
  end
  factory :another_event, class: Event do
    genre
    user
    title { 'dinner' }
    body  { 'coding' }
    start { 'Sat, 15 Aug 2020 08:09:17 +0000' }
  end
end
