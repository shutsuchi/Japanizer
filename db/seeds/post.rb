### Post data
User.all.each do |user|
 5.times do |n|
   user.posts.create!(
     city_id:  n + 1,
     genre_id: n + 1,
     album_id: 1,
     title:    "徒然日記#{n + 1}",
     comment:  "最高",
   )
 end
end
