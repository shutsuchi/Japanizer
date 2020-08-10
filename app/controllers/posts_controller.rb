class PostsController < ApplicationController

  include Page
  include PostUpdate

  # GET /posts
  # posts_path
  def index
    @post = Post.new

    if current_user.nil?
      @posts_pg = Post.page(params[:page]).order(created_at: :desc).per(8)
    else
      if params[:user]
        # Current_user's Post
        pg1 = params[:user]
        @user_posts_pg = type_page_4(current_user.posts, pg1)
      else
        @user_posts_pg = page_4(current_user.posts)
      end
      if params[:other]
        pg2 = params[:other]
        # Other User's Post
        @others_posts_pg = type_page_4(Post.includes(:user).where.not(user_id: current_user.id), pg2)
      else
        @others_posts_pg = page_4(Post.includes(:user).where.not(user_id: current_user.id))
      end
    end
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
    if current_user.present?
      @thepost = find_post(params[:id])
      @user_albums = current_user.albums.all
      if current_user != @thepost.user
        redirect_to top_path
      end
    else
      redirect_to top_path
    end
  end

  # POST /posts
  # posts_path
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # Post attach temporary to album created when user signup
    @post.album_id = current_user.albums.first.id
    if @post.rate.nil?
      @post.rate = 0
    end
    if @post.title.nil?
      @post.title = 'No Title'
    end
    if @post.save
      redirect_to @post, notice: t('posts.flash.s_notice')
    else
      pg1 = params[:user]
      pg2 = params[:other]

      # Current_user's Post
      @user_posts_pg = type_page_4(current_user.posts, pg1)
      # Other User's Post
      @others_posts_pg = type_page_4(Post.includes(:user).where.not(user_id: current_user.id), pg2)
      flash.now[:alert] = t('posts.flash.s_alert')
      render :index
    end
  end

  # PATCH /posts/:id
  # post_path
  def update
    @thepost = find_post(params[:id])
    if @thepost.update(
      genre_id: post_params[:genre_id].to_i,
      prefecture_id: post_params[:prefecture_id].to_i,
      city_id: city_update(@thepost),
      image: post_params[:image],
      title: post_params[:title],
      comment: post_params[:comment],
      rate: rate_update(@thepost)
      )

      redirect_to @thepost, notice: t('posts.flash.u_notice')
    else
      @thepost.user = current_user
      @user_albums = current_user.albums.all
      flash.now[:alert] = t('posts.flash.u_alert')
      render :edit
    end
  end

  # DELETE /posts/:id
  # post_path
  def destroy
    @thepost = find_post(params[:id])
    @thepost.destroy
    redirect_to user_path(current_user), notice: t('posts.flash.d_notice')
  end

  # City Auto Select
  def cities_select
    render partial: 'city', locals: { prefecture_id: params[:prefecture_id] }
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :prefecture_id, :city_id, :genre_id, :image, :title, :rate, :comment, :album_id)
  end

  def find_post(post_id)
    Post.find(post_id)
  end

end
