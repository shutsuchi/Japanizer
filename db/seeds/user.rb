### User data
User.create!(
  name:            "admin",
  email:           "admin@admin",
  age:             26,
  country_code:    "JP",
  withdrawal_flag: "true",
  password:        "adminadmin"
)

5.times do |n|
  User.create!(
    name:            "test#{n + 1}",
    email:           "test#{n + 1}@test",
    age:             n + 1,
    country_code:    "US",
    withdrawal_flag: "false",
    password:        "111111"
  )
end
