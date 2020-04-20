class PrefecturesController < ApplicationController

  # GET prefectures/
  # prefectures_path
  def index
    case params[:area_id]
    when '1'
      @posts = array_page(Post.find_by(prefecture_id: 1))
    when '2'
      @posts = array_page(Post.find_by(prefecture_id: [2, 3, 4, 5, 6, 7]))
    when '3'
      @posts = array_page(Post.find_by(prefecture_id: [15, 16, 17, 18]))
    when '4'
      @posts = array_page(Post.find_by(prefecture_id: [8, 9, 10, 11, 12, 13, 14, 19]))
    when '5'
      @posts = array_page(Post.find_by(prefecture_id: [20, 21, 22, 23, 24]))
    when '6'
      @posts = array_page(Post.find_by(prefecture_id: [25, 26, 27, 28, 29, 30]))
    when '7'
      @posts = array_page(Post.find_by(prefecture_id: [31, 32, 33, 34, 35]))
    when '8'
      @posts = array_page(Post.find_by(prefecture_id: [36, 37, 38, 39]))
    when '9'
      @posts = array_page(Post.find_by(prefecture_id: [40, 41, 42, 43, 44, 45, 46]))
    when '10'
      @posts = array_page(Post.find_by(prefecture_id: 47))
    else
      @posts = page_8(Post)
    end
  end

  private

  def page_8(obj)
    obj.page(params[:page]).reverse_order.per(8)
  end

  def array_page(obj)
    Kaminari.paginate_array([obj]).page(params[:page]).per(8)
  end

end
