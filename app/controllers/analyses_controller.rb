class AnalysesController < ApplicationController
  include Page
  include RankData

  def data
    # Japanese User Ranking
    posts_jp = Post.eager_load(:user).jp
    albums_jp = Album.eager_load(:user).jp
    @jp_area_ranks = Prefecture.find(pref_rank(posts_jp))
    @jp_genre_ranks = Genre.find(genre_rank(posts_jp))
    @jp_budget_ranks = budget_rank(albums_jp)

    # Other Nationalities User Ranking
    posts = Post.eager_load(:user).other
    albums = Album.eager_load(:user).other
    @others_area_ranks = Prefecture.find(pref_rank(posts))
    @others_genre_ranks = Genre.find(genre_rank(posts))
    @others_budget_ranks = budget_rank(albums)
  end

  def rank
    @genres = Genre.where.not(id: 1).all
    @posts = page_8(Post)
    @albums = page_8(Album)

    # Ranking
    # --- Post-Like Ranking
    @post_like_ranks = Post.find(post_rank(Like))
    # --- Post-Comment
    @post_comment_ranks = Post.find(post_rank(PostComment))
    # --- Album-Bookmark
    @album_bookmark_ranks = Album.find(album_rank(Bookmark))
  end

end
