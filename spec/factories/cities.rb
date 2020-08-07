FactoryBot.define do
  factory :city do
    id             { 1 }
    name           { 'Tanaka Taro' }
    created_at     { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at     { 'Thu, 06 Aug 2020 21:40:24 +0000' }
    prefecture_id  { 1 }
    prefecture
  end
end
