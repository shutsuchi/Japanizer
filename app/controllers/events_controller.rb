class EventsController < ApplicationController

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    redirect_to user_path(current_user.id)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @theuser = current_user
    @theevent = find_event(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to user_path(current_user), notice: 'Event was successfully created.'
    else
      @theuser = current_user
      @posts = @theuser.posts.all
      @albums = @theuser.albums.all
      @event = Event.new
      @events = Event.where(user_id: @theuser.id)

      like_count = 0
      comment_count = 0
      bookmark_count = 0
      # Count User-Got
      @posts = @theuser.posts.all
      @albums = @theuser.albums.all
      @get_likes = @posts.each do |post|
                    lk_c = Like.where(post_id: post.id).count
                    like_count += lk_c
      end
      @get_comments = @posts.each do |post|
                        cm_c = PostComment.where(post_id: post.id).count
                        comment_count += cm_c
      end
      @get_bookmarks = @albums.each do |album|
                          bk_c = Bookmark.where(album_id: album.id).count
                          bookmark_count += bk_c
      end

      # Count User-Gave
      @give_likes = Like.where(user_id: @theuser.id).all
      @give_comments = PostComment.where(user_id: @theuser.id).all
      @give_bookmarks = Bookmark.where(user_id: @theuser.id).all
      render user_path(current_user), notice: 'Event was failed to create.'
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
