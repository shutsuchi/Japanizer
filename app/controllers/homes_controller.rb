class HomesController < ApplicationController
  def about
  end

  def top
    # plan to add => range
    # day = Date.today
    # start_day = day.prev_day(30)
    # end_day = Time.now
    # range = start_day.beginning_of_day..end_day
    # @post_like_ranks = month(Post.find(Like.group(:post_id)

    # Ranking
    # --- post Like
    @post_like_ranks = Post.find(Like.group(:post_id)
                                    .order('count(post_id) desc')
                                    .limit(1)
                                    .pluck(:post_id))
    # --- post Comment
    @post_comment_ranks = Post.find(PostComment.group(:post_id)
                                    .order('count(post_id) desc')
                                    .limit(1)
                                    .pluck(:post_id))
    # --- album Bookmark
    @album_ranks = Album.find(Bookmark.group(:album_id)
                                      .order('count(album_id) desc')
                                      .limit(1)
                                      .pluck(:album_id))
  end

end
