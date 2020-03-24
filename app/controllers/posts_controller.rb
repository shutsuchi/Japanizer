class PostsController < ApplicationController
  def index
    @post = Post.new
    @postspg = Post.page(params[:page]).reverse_order.per(8)
    @userpostspg = current_user.posts.page(params[:page]).reverse_order.per(4)
  end

  def show
    @thepost = find_post(params[:id])
    @comment = PostComment.new
    @comments = @thepost.post_comments.all
    @pagecomments = @thepost.post_comments.page(params[:page]).reverse_order.per(5)
    @commentspg = @thepost.post_comments.page(params[:page]).reverse_order.per(5)
  end

  def edit
    @thepost = find_post(params[:id])
    @useralbums = current_user.albums.all
    #if @thepost.user != current_user
    #  redirect_back(fallback_location: top_path)
    #end
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    # User新規作成時に生成されるからアルバムに暫定的に所属させる
    post.album_id = current_user.albums.first.id
    #post.genre_id = params[:post][:genre_id]
    #post.city_id = params[:post][:city_id]
    if post.save
      redirect_to post
    else
      render new_post_path
    end
  end

  def update
    post = find_post(params[:id])
    if post.update(
        genre_id: post_params[:genre_id].to_i,
        prefecture_id: post_params[:prefecture_id].to_i,
        city_id: post_params[:city_id].to_i,
        image: post_params[:image],
        title: post_params[:title],
        comment: post_params[:comment],
        rate: post_params[:rate].to_i
      )
      redirect_to post
    else
      @thepost.user = current_user
      render :edit
    end
  end

  def destroy
    post = find_post(params[:id])
    post.destroy
    redirect_to user_path(current_user)
  end

  def cities_select
    render partial: 'city', locals: { prefecture_id: params[:prefecture_id] }
  end


  private

    def post_params
      params.require(:post).permit(:user_id, :prefecture_id, :city_id, :genre_id, :image, :title, :rate, :comment, album_id: [])
    end

    def find_post(post_id)
      Post.find(post_id)
    end

end
