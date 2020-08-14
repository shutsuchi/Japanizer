# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  age                    :integer          not null
#  country_code           :string(255)      not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  name                   :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  state_code             :string(255)
#  withdrawal_flag        :boolean          default(FALSE), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  image_id               :string(255)
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    name                { 'Tanaka Taro' }
    sequence(:email)    { |n| "tanaka#{n}@example.com" }
    sequence(:password) { |n| "TEST_PASS#{n}" }
    age                 { 24 }
    country_code        { 'JP' }
    withdrawal_flag     { false }
  end
  factory :another_user, class: User do
    name                { 'Jhon yard' }
    sequence(:email)    { |n| "jhon#{n}@example.com" }
    sequence(:password) { |n| "TEST_JHON#{n}" }
    age                 { 45 }
    country_code        { 'US' }
    withdrawal_flag     { false }
  end
end
