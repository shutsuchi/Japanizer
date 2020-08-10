class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[show edit update withdraw]
  before_action :correct_user, only: %i[show edit withdraw]

  include UserStatus
  include Page

  # GET /users/:id
  # user_path
  def show
    pg_p = params[:post]
    pg_a = params[:album]
    @theuser = current_user
    @posts_pg = type_page_8(@theuser.posts, pg_p)
    @albums_pg = type_page_6(@theuser.albums, pg_a)
    @event = Event.new
    @events = Event.where(user_id: @theuser.id)

    # Count User Got
    @posts = @theuser.posts
    @albums = @theuser.albums

    @get_likes = get_post(@posts, Like)
    @get_comments = get_post(@posts, PostComment)
    @get_bookmarks = get_album(@albums, Bookmark)

    # Count User Gave
    @give_likes = give_obj(Like, @theuser)
    @give_comments = give_obj(PostComment, @theuser)
    @give_bookmarks = give_obj(Bookmark, @theuser)

    respond_to do |format|
      format.html
      format.json { render json: @events }
    end
  end

  # GET /users/:id/edit
  # edit_user_path
  def edit
    @theuser = current_user
  end

  # GET /users/:user_id/withdraw
  # withdraw_path
  def withdraw
    @theuser = current_user
  end

  # PATCH /users/:user_id/switch
  # switch_path
  def switch
    @theuser = current_user
    if @theuser.update(withdrawal_flag: false)
      redirect_to top_path
    else
      render :withdraw
    end
  end

  # PATCH /users/:id
  # user_path
  def update
    @theuser = current_user
    if @theuser.update(user_params)
      redirect_to user_path(@theuser.id), notice: t('users.flash.u_notice')
    else
      flash.now[:alert] = t('users.flash.u_alert')
      render :edit, notice: 'Failed to Update'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :image, :age, :country_code)
  end

  def correct_user
    if params[:user_id]
      user = User.find(params[:user_id])
      if user.id != current_user.id
        redirect_to top_path
      end
    elsif params[:id] != 'sign_out'
      user = User.find(params[:id])
      if user.id != current_user.id
        redirect_to top_path
      end
    end

  end

end
