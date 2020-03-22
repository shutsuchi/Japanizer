User.all.each do |user|
  user.events.create!(
    genre_id:    1,
    title:       "デート",
    description: "マリンスポーツ",
    start_date:  "Sun, 22 Mar 2020 11:12:03 +0000",
    end_date:    "Mon, 23 Mar 2020 12:12:03 +0000",
    budget:      "1~3",
    mean:        "自転車",
  )
end
