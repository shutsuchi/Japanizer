class HomesController < ApplicationController
  include RankData

  # GET /about
  # about_path
  def about
  end

  # GET /top
  # top_path
  def top
    # plan to add => range
    # day = Date.today
    # start_day = day.prev_day(30)
    # end_day = Time.now
    # range = start_day.beginning_of_day..end_day
    # @post_like_ranks = month(Post.find(Like.group(:post_id)

    # Ranking
    @post_like_ranks = Post.find(post_first(Like))
    @post_comment_ranks = Post.find(post_first(PostComment))
    @album_ranks = Album.find(album_first(Bookmark))
  end

end
