class AnalysesController < ApplicationController
  include Page

  def data
    # Japanese User Ranking
    posts = Post.joins(:user).where("users.country_code = 'JP'").all
    albums = Album.joins(:user).where("users.country_code = 'JP'").all
    @jp_area_ranks = Prefecture.find(posts.group(:prefecture_id)
                                          .order('count(prefecture_id) desc')
                                          .limit(3)
                                          .pluck(:prefecture_id))
    @jp_genre_ranks = Genre.find(posts.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .limit(3)
                                      .pluck(:genre_id))
    @jp_budget_ranks = albums.group(:budget)
                             .order('count(budget) desc')
                             .limit(3)
                             .pluck(:budget)
    # Other Nationalities User Ranking
    posts = Post.joins(:user).where.not("users.country_code = 'JP'").all
    albums = Album.joins(:user).where.not("users.country_code = 'JP'").all
    @others_area_ranks = Prefecture.find(posts.group(:prefecture_id)
                                              .order('count(prefecture_id) desc')
                                              .limit(3)
                                              .pluck(:prefecture_id))
    @others_genre_ranks = Genre.find(posts.group(:genre_id)
                                          .order('count(genre_id) desc')
                                          .limit(3)
                                          .pluck(:genre_id))
    @others_budget_ranks = albums.group(:budget)
                                 .order('count(budget) desc')
                                 .limit(3)
                                 .pluck(:budget)
  end

  def rank
    @genres = Genre.where.not(id: 1).all
    @posts = page_8(Post)
    @albums = page_8(Album)
    # Ranking
    # --- Genre-Post
    @genre_post_ranks = Genre.find(Post.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # --- Genre-Album
    @genre_album_ranks = Genre.find(Album.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # --- Post-Like Ranking
    @post_like_ranks = Post.find(Like.group(:post_id)
                                    .order('count(post_id) desc')
                                    .limit(5)
                                    .pluck(:post_id))
    # --- Post-Comment
    @post_comment_ranks = Post.find(PostComment.group(:post_id)
                                              .order('count(post_id) desc')
                                              .limit(5)
                                              .pluck(:post_id))
    # --- Album-Bookmark
    @album_bookmark_ranks = Album.find(Bookmark.group(:album_id)
                                      .order('count(album_id) desc')
                                      .limit(5)
                                      .pluck(:album_id))
  end

  private

  def find_genre(genre_id)
    return Genre.find(genre_id) if genre_id.present?
  end

end
