### User data
User.create!(
  name:            "admin",
  email:           "admin@admin",
  age:             26,
  country_code:    "JP",
  withdrawal_flag: "true",
  password:        "adminadmin"
)

# 5.times do |n|
#   User.create!(
#     name:            "test#{n + 1}",
#     email:           "test#{n + 1}@test",
#     age:             n + 1,
#     country_code:    "US",
#     withdrawal_flag: "false",
#     password:        "111111"
#   )
# end

# 2
User.create!(
  name:            "田中太郎",
  email:           "tanaka@email.com",
  age:             "24",
  country_code:    "JP",
  withdrawal_flag: "false",
  password:        "tanakadesu"
)

# 3
User.create!(
  name:            "山田次郎",
  email:           "jirojiro@email.com",
  age:             "41",
  country_code:    "JP",
  withdrawal_flag: "false",
  password:        "yamadajiro21"
)

# 4
User.create!(
  name:            "John Smith",
  email:           "john1222@ezweb.com",
  age:             "31",
  country_code:    "US",
  withdrawal_flag: "false",
  password:        "john1222"
)

# 5
User.create!(
  name:            "黄秀英",
  email:           "fanfan@gmail.com",
  age:             "18",
  country_code:    "CN",
  withdrawal_flag: "false",
  password:        "chichifan"
)

# 6
User.create!(
  name:            "Andrea Muller",
  email:           "eeeeand@gmail.com",
  age:             "42",
  country_code:    "DE",
  withdrawal_flag: "false",
  password:        "germanyandrea"
)

# 7
User.create!(
  name:            "金 本貫",
  email:           "kimkim@gmail.com",
  age:             "42",
  country_code:    "KR",
  withdrawal_flag: "false",
  password:        "kimkimkim"
)
