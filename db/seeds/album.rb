# User.all.each do |user|
#   user.albums.create!(
#     genre_id: 2,
#     title:    "サイクリング",
#     post_quantity: 0,
#     rate:     2.5,
#   )
# end

Album.create!(
  album_id:       1,
  user_id:        2,
  genre_id:       2,
  title:          "初デート",
  post_quantity:  "",
  comment:        "ドライブ~高尾山",
  rate:           4.5,
  budget:         "1 ~ 3",
  mean:           "",
  people:         2,
)

Album.create!(
  album_id:       2,
  user_id:        2,
  genre_id:       10,
  title:          "富士登山",
  post_quantity:  "",
  comment:        "大いに疲れた",
  rate:           4,
  budget:         "1 ~ 3",
  mean:           "",
  people:         5,
)

Album.create!(
  album_id:       3,
  user_id:        3,
  genre_id:       3,
  title:          "四国漫遊",
  post_quantity:  "",
  comment:        "また行きたいなあ",
  rate:           5,
  budget:         "3 ~ 5",
  mean:           "",
  people:         1,
)

Album.create!(
  album_id:       4,
  user_id:        4,
  genre_id:       5,
  title:          "First Trip in Japan!",
  post_quantity:  "",
  comment:        "Never see that much beautiful city!!! Everybody should come.",
  rate:           5,
  budget:         "10 ~ 20",
  mean:           "",
  people:         3,
)

Album.create!(
  album_id:       5,
  user_id:        5,
  genre_id:       4,
  title:          "購物天堂",
  post_quantity:  "",
  comment:        "我找各種到了",
  rate:           3.5,
  budget:         "7 ~ 9",
  mean:           "",
  people:         4,
)

Album.create!(
  album_id:       6,
  user_id:        6,
  genre_id:       8,
  title:          "activity in Japan",
  post_quantity:  "",
  comment:        "Amazing sking and food",
  rate:           4,
  budget:         "30 ~ 40",
  mean:           "",
  people:         3,
)

Album.create!(
  album_id:       7,
  user_id:        7,
  genre_id:       5,
  title:          "3days @Japan",
  post_quantity:  "",
  comment:        "Tokyo city  was similar to Korea city but little costy...",
  rate:           2.5,
  budget:         "10 ~ 20",
  mean:           "",
  people:         2,
)
