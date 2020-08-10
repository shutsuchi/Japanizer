class PrefecturesController < ApplicationController

  include PrefPost
  include Page

  # GET prefectures/
  # prefectures_path
  def index
    if params[:area_id]
      area = params[:area_id]
      @posts = area_choice(area)
    elsif params[:pref_id]
      pref = params[:pref_id]
      @posts = pref_choice(pref)
    else
      @posts = page_8(Post)
    end
  end

end
