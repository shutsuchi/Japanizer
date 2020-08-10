class EventsController < ApplicationController

  include UserStatus
  include Page

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    redirect_to user_path(current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @theevent = find_event(params[:id])
    if @theevent.user == current_user
      @theuser = current_user
    else
      redirect_to top_path
    end
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to user_path(current_user), notice: t('events.flash.notice')
    else
      pg_p = params[:post]
      pg_a = params[:album]
      @theuser = current_user
      @posts_pg = type_page_8(@theuser.posts, pg_p)
      @albums_pg = type_page_6(@theuser.albums, pg_a)
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
      # render user_path(current_user), notice: 'Event was failed to create.'
      flash.now[:alert] = t('events.flash.alert')
      render 'users/show'
    end
  end

  def update
    event = find_event(params[:id])
    @events = Event.where(user_id: current_user.id)
    event.update(event_params)
  end

  def destroy
    @user = find_User(params[:id])
    event = Event.find(params[:id])
    if event.destroy
      redirect_to user_path(@user)
    end
  end

  private

  def find_event(event_id)
    Event.find(event_id)
  end

  def find_user(user_id)
    User.find(user_id)
  end

  def event_params
    params.require(:event).permit(:user_id, :genre_id, :title, :body, :start, :end)
  end

end
