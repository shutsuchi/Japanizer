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

  def rank
    @genres = Genre.where.not(id: 1).all
    @posts = page(Post)
    @albums = page(Album)
    # ランキング
    # genre 投稿ランキング
    @genre_post_ranks = Genre.find(Post.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # genre アルバムランキング
    @genre_album_ranks = Genre.find(Album.group(:genre_id)
                                      .order('count(genre_id) desc')
                                      .pluck(:genre_id))
    # post Like数ランキング
    @post_like_ranks = Post.find(Like.group(:post_id)
                                    .order('count(post_id) desc')
                                    .limit(5)
                                    .pluck(:post_id))
    # post Comment数ランキング
    @post_comment_ranks = Post.find(PostComment.group(:post_id)
                                              .order('count(post_id) desc')
                                              .limit(5)
                                              .pluck(:post_id))
    # album Bookmark数ランキング
    @album_bookmark_ranks = Album.find(Bookmark.group(:album_id)
                                      .order('count(album_id) desc')
                                      .limit(5)
                                      .pluck(:album_id))
    # genre選択時、表示されている投稿とアルバムを
    # 選択されたgenreに紐づく対象に変更
    #if find_genre(params[:id])
    #  genre = find_genre(params[:id])
    #  genre.id = params[:id]
    #  @post_like_genre_ranks = genre.posts.find(Like.group(:post_id)
    #                                                .order('count(post_id) desc')
    #                                                .limit(5)
    #                                                .pluck(:post_id))
    #  @post_comment_genre_ranks = genre.posts.find(PostComment.group(:post_id)
    #                                                        .order('count(post_id) desc')
    #                                                        .limit(5)
    #                                                        .pluck(:post_id))
    #  @album_bookmark_genre_ranks = genre.albums.find(Bookmark.group(:album_id)
    #                                                        .order('count(album_id) desc')
    #                                                        .limit(5)
    #                                                        .pluck(:album_id))
    #end
  end

    private
    def page(obj)
      obj.page(params[:page]).reverse_order.per(8)
    end
    def find_genre(genre_id)
      return Genre.find(genre_id) if genre_id.present?
    end

end
