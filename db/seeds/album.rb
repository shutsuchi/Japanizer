User.all.each do |user|
  user.albums.create!(
    genre_id: 2,
    title:    "サイクリング",
    post_quantity: 0,
    rate:     2.5,
  )
end
