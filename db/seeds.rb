# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

### User data
User.create!(
  name:            "admin",
  email:           "admin@admin",
  age:             26,
  country:         "JP",
  withdrawal_flag: "true",
  password:        "admin"
)

5.times do |n|
  User.create!(
    name:            "test#{n + 1}",
    email:           "test#{n + 1}@test",
    age:             n + 1,
    country:         "US",
    withdrawal_flag: "false",
    password:        "111111"
  )
end

### Plan data
User.all.each do |user|
  User.plans.create!(
    genre_id:    n + 1,
    first_date: "2020/0#{n + 1}/0#{n + 1}",
    last_date:  "2020/0#{n + 1}/0#{n + 1}",
    budget:      n + 1,
    mean:       "車",
    purpose:    "家族旅行",
    people:      n + 1,
    memo:       "test#{n + 1}"
  )
end

### Genre data
[
  ["デート"],
  ["一人旅"],
  ["ショッピング"],
  ["都市観光"],
  ["ツーリング"],
  ["グルメ"],
  ["アクティビティ"],
  ["ドライブ"],
  ["自然"],
].each do |name|
  Genre.create!(
    { name: name }
  )

### Prefecture & City data
require 'csv'

CSVROW_PREFNAME = 6
CSVROW_CITYNAME = 7

CSV.foreach('db/csv/prefecture.CSV', encoding: "Shift_JIS:UTF-8") do |row|
  prefecture_name = row[CSVROW_PREFNAME]
  city_name = row[CSVROW_CITYNAME]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
end
