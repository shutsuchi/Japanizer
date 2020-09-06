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

    @events = Event.where(user_id: current_user.id)
    respond_to do |format|
      format.js if @event.save
      format.js { render :modal_create }
    end
  end

  # PATCH /event/:id
  # event_path
  def update
    @event = find_event(params[:id])
    @events = Event.where(user_id: current_user.id)
    respond_to do |format|
      format.js if @event.update(event_params)
    end
  end

  # DELETE /event/:id
  # event_path
  def destroy
    event = Event.find(params[:id])
    @user = event.user
    @events = Event.where(user_id: current_user.id)

    respond_to do |format|
      format.js if event.destroy
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
