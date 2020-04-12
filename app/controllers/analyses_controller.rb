class AnalysesController < ApplicationController

  def data
     # 日本ユーザランキング
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
     # 日本以外の国籍ユーザランキング
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


end
