class PrefecturesController < ApplicationController

  # GET prefectures/
  # prefectures_path
  def index
    #
    if params[:area_id] == "1"
      @posts = array_page(Post.find_by(prefecture_id: 1))
      #@posts = array_page(posts)
      #@posts = Kaminari.paginate_array([@posts]).page(params[:page]).per(8)
    elsif params[:area_id] == "2"
      @posts = array_page(Post.find_by(prefecture_id: [2,3,4,5,6,7]))
    elsif params[:area_id] == "3"
      @posts = array_page(Post.find_by(prefecture_id: [15,16,17,18]))
    elsif params[:area_id] == "4"
      @posts = array_page(Post.find_by(prefecture_id: [8,9,10,11,12,13,14,19]))
    elsif params[:area_id] == "5"
      @posts = array_page(Post.find_by(prefecture_id: [20,21,22,23,24]))
    elsif params[:area_id] == "6"
      @posts = array_page(Post.find_by(prefecture_id: [25,26,27,28,29,30]))
    elsif params[:area_id] == "7"
      @posts = array_page(Post.find_by(prefecture_id: [31,32,33,34,35]))
    elsif params[:area_id] == "8"
      @posts = array_page(Post.find_by(prefecture_id: [36,37,38,39]))
    elsif params[:area_id] == "9"
      @posts = array_page(Post.find_by(prefecture_id: [40,41,42,43,44,45,46]))
    elsif params[:area_id] == "10"
      @posts = array_page(Post.find_by(prefecture_id: 47))
    else
      @posts = page(Post)
    end
  end

  private
    def page(obj)
      obj.page(params[:page]).reverse_order.per(8)
    end
    def array_page(obj)
      Kaminari.paginate_array([obj]).page(params[:page]).per(8)
    end
end
