User.all.each do |user|
  user.events.create!(
    genre_id:    1,
    title:       "デート",
    body:        "マリンスポーツ",
    start:       "Sun, 22 Mar 2020 11:12:03 +0000",
    end:         "Mon, 23 Mar 2020 12:12:03 +0000",
  )
end
