# == Schema Information
#
# Table name: genres
#
#  id         :bigint           not null, primary key
#  en_name    :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :genre do
    name        { 'デート' }
    en_name     { 'Date' }
    created_at  { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at  { 'Thu, 06 Aug 2020 21:40:24 +0000' }
  end
  factory :genre2, class: Genre do
    name        { 'デート' }
    en_name     { 'Date' }
    created_at  { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at  { 'Thu, 06 Aug 2020 21:40:24 +0000' }
  end
  factory :genre3, class: Genre do
    name        { '一人旅' }
    en_name     { 'Date' }
    created_at  { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at  { 'Thu, 06 Aug 2020 21:40:24 +0000' }
  end
end
