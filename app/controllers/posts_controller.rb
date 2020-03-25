class PostsController < ApplicationController
  # GET /posts
  # posts_path
  def index
    @post = Post.new
    @posts_pg = Post.page(params[:page]).reverse_order.per(8)
    @user_posts_pg = current_user.posts.page(params[:page]).reverse_order.per(4)
      # current_user 以外の投稿
    #@other_users = User.where.not(id: current_user.id).select(:id).shuffle
    @others_posts_pg = Post.includes(:user).where.not(user_id: current_user.id).page(params[:page]).reverse_order.per(8)
      #other_users.each do |user|
      #   user.posts
      #i = 1
      #c = other_users.count
      #while i < c do
      #  other_users[0].concat(other_users[i].posts)
      #  i += 1
      #end
      #@other_posts_pg = other_user_posts.shuffle.page(params[:page]).reverse.order.per(8)
  end

  # GET /post/:id
  # post_path
  def show
    @thepost = find_post(params[:id])
    @comment = PostComment.new
    @comments = @thepost.post_comments.all
    @comments_pg = @thepost.post_comments.page(params[:page]).reverse_order.per(5)
  end

  # GET /post/:id/edit
  # edit_post_path
  def edit
    @thepost = find_post(params[:id])
    @user_albums = current_user.albums.all
    #if @thepost.user != current_user
    #  redirect_back(fallback_location: top_path)
    #end
  end

  # POST /posts
  # posts_path
  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    # User新規作成時に生成されるからアルバムに暫定的に所属させる
    post.album_id = current_user.albums.first.id
    if post.rate.nil?
      post.rate = 0
    end
    if post.save!
      redirect_to post
    else
      render posts_path
    end
  end

  # PATCH /posts/:id
  # post_path
  def update
    thepost = find_post(params[:id])
    if thepost.update!(
        genre_id: post_params[:genre_id].to_i,
        prefecture_id: post_params[:prefecture_id].to_i,
        city_id: city_update(thepost),
        image: post_params[:image],
        title: post_params[:title],
        comment: post_params[:comment],
        rate: rate_update(thepost)
      )
      redirect_to thepost
    else
      thepost.user = current_user
      render edit_album_path
    end
  end

  def city_update(post)
    if params[:post][:city_id].blank?
      post.city_id
    else
      params[:post][:city_id]
    end
  end

  def rate_update(post)
    if post_params[:rate].blank?
      # 評価をゼロに更新したい可能性は一時的に無視
      post.rate.to_i
    else
      post_params[:rate].to_i
    end
  end

  # DELETE /posts/:id
  # post_path
  def destroy
    post = find_post(params[:id])
    post.destroy!
    redirect_to user_path(current_user)
  end

  # City自動選択機能メソッド
  def cities_select
    render partial: 'city', locals: { prefecture_id: params[:prefecture_id] }
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :prefecture_id, :city_id, :genre_id, :image, :title, :rate, :comment, :album_id )
    end

    def find_post(post_id)
      Post.find(post_id)
    end

end
