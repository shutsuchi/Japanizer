# == Schema Information
#
# Table name: prefectures
#
#  id         :bigint           not null, primary key
#  en_name    :string(255)      not null
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :prefecture do
    name                { '北海道' }
    en_name             { 'Hokkaido' }
    created_at          { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at          { 'Thu, 06 Aug 2020 21:40:24 +0000' }
  end
end
