class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @comment = PostComment.new
    @thepost = Post.find(params[:id])
    @comments = @post.post_comments.all
  end

  def edit
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    #post.genre_id = params[:post][:genre_id]
    #post.city_id = params[:post][:city_id]
    binding.pry
    if post.save
      redirect_to post
    else
      render new_post_path
    end
  end

  def update
  end

  def destroy

  end

  private
  def post_params
    params.require(:post).permit(:user_id, :city_id, :genre_id, :title, :comment,)
  end
end
