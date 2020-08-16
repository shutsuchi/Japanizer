class EventsController < ApplicationController
  before_action :authenticate_user!

  include UserStatus
  include Page

  # GET /events
  # GET /events.json
  # events_path
  def index
    @events = Event.all
    redirect_to user_path(current_user)
  end

  # GET /events/:id
  # GET /events/1.json
  # event_path
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
  # events_path
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to user_path(current_user), notice: t('events.flash.s_notice')
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
      flash.now[:alert] = t('events.flash.s_alert')
      render 'users/show'
    end
  end

  # PATCH /event/:id
  # event_path
  #def update
  #  event = find_event(params[:id])
  #  @events = Event.where(user_id: current_user.id)
  #  if event.update(event_params)
  #    redirect_to event, notice: t('events.flash.u_notice')
  #  else
  #    flash.now[:alert] = t('events.flash.u_alert')
  #    render user_path(current_user)
  #  end
  #end

  # DELETE /event/:id
  # event_path
  def destroy
    event = Event.find(params[:id])
    @user = event.user
    if event.destroy
      redirect_to user_path(@user), notice: t('events.flash.d_notice')
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
