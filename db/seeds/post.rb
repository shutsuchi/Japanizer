#----- User2 田中
#-- album1
Post.create!(
  id:             1,
  user_id:        2,
  prefecture_id:  13,
  city_id:        678,
  genre_id:       2,
  album_id:       1,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_01.jpg"),
  rate:           2,
  title:          "いざ高尾山",
  comment:        "レンタカーしてドライブしたけど、安かったせいか、ナビが古くて運転が大変でしたよ。。",
)

Post.create!(
  id:             2,
  user_id:        2,
  prefecture_id:  13,
  city_id:        678,
  genre_id:       2,
  album_id:       1,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_02.jpg"),
  rate:           2,
  title:          "のんびり登山",
  comment:        "ゆったり高尾山道を登って、頂上でカレー食べました。",
)

#-- album2
Post.create!(
  id:             3,
  user_id:        2,
  prefecture_id:  19,
  city_id:        864,
  genre_id:       10,
  album_id:       2,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_03.jpg"),
  rate:           4,
  title:          "快晴、登山日和",
  comment:        "最高の天気で、いざ富士山頂へ！",
)

Post.create!(
  id:             4,
  user_id:        2,
  prefecture_id:  19,
  city_id:        864,
  genre_id:       10,
  album_id:       2,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_04.jpg"),
  rate:           5,
  title:          "ご来光",
  comment:        "雲海から出てくるご来光に、寒い中感動一塩ですなあ",
)

Post.create!(
  id:             5,
  user_id:        2,
  prefecture_id:  19,
  city_id:        864,
  genre_id:       10,
  album_id:       2,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_05.jpg"),
  rate:           4.5,
  title:          "河口湖に一泊",
  comment:        "登山後にのんびりロッジに一泊。あまり美味しくない料理作って最高でした！",
)

#----- User3 山田
#-- album3
Post.create!(
  id:             6,
  user_id:        3,
  prefecture_id:  36,
  city_id:        1512,
  genre_id:       3,
  album_id:       3,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_06.jpg"),
  rate:           4,
  title:          "徳島県！",
  comment:        "四国上陸",
)

Post.create!(
  id:             7,
  user_id:        3,
  prefecture_id:  37,
  city_id:        1536,
  genre_id:       3,
  album_id:       3,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_07.jpg"),
  rate:           4.5,
  title:          "香川県！",
  comment:        "うどん作り",
)

Post.create!(
  id:             8,
  user_id:        3,
  prefecture_id:  38,
  city_id:        1553,
  genre_id:       3,
  album_id:       3,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_08.jpg"),
  rate:           5,
  title:          "愛媛県！",
  comment:        "みかん最高",
)

Post.create!(
  id:             9,
  user_id:        3,
  prefecture_id:  39,
  city_id:        1573,
  genre_id:       3,
  album_id:       3,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_09.jpg"),
  rate:           3.5,
  title:          "高知県！",
  comment:        "疲れました",
)

#----- User4 John
#-- album4
Post.create!(
  id:             10,
  user_id:        4,
  prefecture_id:  13,
  city_id:        655,
  genre_id:       5,
  album_id:       4,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_10.jpg"),
  rate:           5,
  title:          "Amazing Japan",
  comment:        "woooooooo!!!Akihabara!!!",
)

Post.create!(
  id:             11,
  user_id:        4,
  prefecture_id:  13,
  city_id:        655,
  genre_id:       5,
  album_id:       4,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_11.jpg"),
  rate:           5,
  title:          "Osaka!Nandeyanen!",
  comment:        "cool, yummy, takoyaki!",
)

#----- User5 黄
#-- album5
Post.create!(
  id:             12,
  user_id:        5,
  prefecture_id:  1,
  city_id:        1,
  genre_id:       7,
  album_id:       5,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_12.jpg"),
  rate:           5,
  title:          "海鮮節",
  comment:        "超美味的",
)

#----- User6 Andrea
#-- album6
Post.create!(
  id:             13,
  user_id:        6,
  prefecture_id:  10,
  city_id:        489,
  genre_id:       8,
  album_id:       6,
  image:          open("#{Rails.root}/app/assets/images/fixtures/post_13.jpg"),
  rate:           5,
  title:          "Ski trip",
  comment:        "Great snow, easy to ski",
)
