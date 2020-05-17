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

# t.integer "user_id", null: false
# t.integer "post_id", null: false
# t.string "title", null: false
# t.text "comment", null: false
# t.float "rate", default: 0.0, null: false

PostComment.create!(
  user_id:    3,
  post_id:    4,
  title:      "綺麗",
  comment:    "行ってみたい!",
  rate:       5,
)

PostComment.create!(
  user_id:    4,
  post_id:    4,
  title:      "Breathtaking...",
  comment:    "I wanna go there someday...",
  rate:       5,
)

PostComment.create!(
  user_id:    6,
  post_id:    4,
  title:      "add this to my plan",
  comment:    "Mt.Fuji...I decided to go next month!!",
  rate:       5,
)

PostComment.create!(
  user_id:    2,
  post_id:    7,
  title:      "いいな",
  comment:    "自分で作ったうどんは美味しそうですね！",
  rate:       4.5,
)

PostComment.create!(
  user_id:    2,
  post_id:    8,
  title:      "いいな",
  comment:    "みかんも美味しそう",
  rate:       4.5,
)

PostComment.create!(
  user_id:    3,
  post_id:    11,
  title:      "Great",
  comment:    "You should go to MEIDO cafe!!",
  rate:       4.5,
)

PostComment.create!(
  user_id:    2,
  post_id:    11,
  title:      "Welcome",
  comment:    "Welcome to Japan!",
  rate:       4.5,
)

PostComment.create!(
  user_id:    5,
  post_id:    11,
  title:      "good",
  comment:    "this place was good for shopping.",
  rate:       4.5,
)

PostComment.create!(
  user_id:    3,
  post_id:    13,
  title:      "my favorite",
  comment:    "Please try to go to Niigata next time.",
  rate:       4.5,
)
