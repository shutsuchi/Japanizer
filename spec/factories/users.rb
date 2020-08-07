FactoryBot.define do
  factory :user do
    # sequence(:id) { |n| n }
    # sequence(:password) { |n| "TEST_PASS#{n}" }
    id                  { 1 }
    name                { 'Tanaka Taro' }
    email               { |n| 'tanaka#{n}@example.com' }
    password            { 'tanakatanaka' }
    age                 { 24 }
    country_code        { 'JP' }
    withdrawal_flag     { false }
    created_at          { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at          { 'Thu, 06 Aug 2020 21:40:24 +0000' }
  end
end
