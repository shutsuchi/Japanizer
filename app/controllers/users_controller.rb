class UsersController < ApplicationController
  def show
    @posts = current_user.posts.all
    @event = Event.new
    @events = Event.where(user_id: current_user.id)
  end

  def edit
  end

  def withdraw
  end

  def switch

  end
end
