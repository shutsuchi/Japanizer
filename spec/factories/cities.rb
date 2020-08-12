# == Schema Information
#
# Table name: cities
#
#  id            :bigint           not null, primary key
#  name          :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  prefecture_id :integer          not null
#
FactoryBot.define do
  factory :city do
    name           { 'Tanaka Taro' }
    created_at     { 'Thu, 06 Aug 2020 21:38:22 +0000' }
    updated_at     { 'Thu, 06 Aug 2020 21:40:24 +0000' }
    prefecture
  end
end
