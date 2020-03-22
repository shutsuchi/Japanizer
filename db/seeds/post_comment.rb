Post.all.each do |post|
  5.times do |n|
    post.post_comments.create!(
      user_id: n + 1,
      title: "最高",
      comment: "いいですね",
      rate: 5,
    )
  end
end
