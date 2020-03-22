User.all.each do |user|
  user.albums.create!(
    genre_id: 2,
    event_id: 1,
    title:    "サイクリング",
    post_quantity: 0,
  )
end
