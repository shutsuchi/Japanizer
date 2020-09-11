User.create!(
  id:              1,
  name:            "admin",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_01.jpg"),
  email:           "admin@admin",
  age:             26,
  country_code:    "JP",
  withdrawal_flag: true,
  password:        "adminadmin"
)

# 2
User.create!(
  id:              2,
  name:            "田中太郎",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_02.jpg"),
  email:           "tanaka@email.com",
  age:             24,
  country_code:    "JP",
  withdrawal_flag: false,
  password:        "tanakadesu",
)

# 3
User.create!(
  id:              3,
  name:            "山田次郎",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_03.jpg"),
  email:           "jirojiro@email.com",
  age:             41,
  country_code:    "JP",
  withdrawal_flag: false,
  password:        "yamadajiro21",
)

# 4
User.create!(
  id:              4,
  name:            "John Smith",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_04.jpg"),
  email:           "john1222@ezweb.com",
  age:             31,
  country_code:    "US",
  withdrawal_flag: false,
  password:        "john1222",
)

# 5
User.create!(
  id:              5,
  name:            "黄秀英",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_05.jpg"),
  email:           "fanfan@gmail.com",
  age:             18,
  country_code:    "CN",
  withdrawal_flag: false,
  password:        "chichifan",
)

# 6
User.create!(
  id:              6,
  name:            "Andrea Muller",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_06.jpg"),
  email:           "eeeeand@gmail.com",
  age:             42,
  country_code:    "DE",
  withdrawal_flag: false,
  password:        "germanyandrea",
)

# 7
User.create!(
  id:              7,
  name:            "金 本貫",
  image:           open("#{Rails.root}/app/assets/images/fixtures/icon_07.jpg"),
  email:           "kimkim@gmail.com",
  age:             42,
  country_code:    "KR",
  withdrawal_flag: false,
  password:        "kimkimkim",
)
