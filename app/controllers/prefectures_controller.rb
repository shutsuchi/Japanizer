class PrefecturesController < ApplicationController

  include PrefPost
  include Page

  # GET prefectures/
  # prefectures_path
  def index
    area = params[:area_id]

    @posts = pref_post(area)
  end

end
