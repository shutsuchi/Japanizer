module PrefPost
  extend ActiveSupport::Concern

  def area_choice(area)
    case area
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
    end
  end

  def pref_choice(pref)
    case pref
    when '1'
      @posts = array_page(Post.find_by(prefecture_id: 1))
    when '2'
      @posts = array_page(Post.find_by(prefecture_id: 2))
    when '3'
      @posts = array_page(Post.find_by(prefecture_id: 3))
    when '4'
      @posts = array_page(Post.find_by(prefecture_id: 4))
    when '5'
      @posts = array_page(Post.find_by(prefecture_id: 5))
    when '6'
      @posts = array_page(Post.find_by(prefecture_id: 6))
    when '7'
      @posts = array_page(Post.find_by(prefecture_id: 7))
    when '8'
      @posts = array_page(Post.find_by(prefecture_id: 8))
    when '9'
      @posts = array_page(Post.find_by(prefecture_id: 9))
    when '10'
      @posts = array_page(Post.find_by(prefecture_id: 10))
    when '11'
      @posts = array_page(Post.find_by(prefecture_id: 11))
    when '12'
      @posts = array_page(Post.find_by(prefecture_id: 12))
    when '13'
      @posts = array_page(Post.find_by(prefecture_id: 13))
    when '14'
      @posts = array_page(Post.find_by(prefecture_id: 14))
    when '15'
      @posts = array_page(Post.find_by(prefecture_id: 15))
    when '16'
      @posts = array_page(Post.find_by(prefecture_id: 16))
    when '17'
      @posts = array_page(Post.find_by(prefecture_id: 17))
    when '18'
      @posts = array_page(Post.find_by(prefecture_id: 18))
    when '19'
      @posts = array_page(Post.find_by(prefecture_id: 19))
    when '20'
      @posts = array_page(Post.find_by(prefecture_id: 20))
    when '21'
      @posts = array_page(Post.find_by(prefecture_id: 21))
    when '22'
      @posts = array_page(Post.find_by(prefecture_id: 22))
    when '23'
      @posts = array_page(Post.find_by(prefecture_id: 23))
    when '24'
      @posts = array_page(Post.find_by(prefecture_id: 24))
    when '25'
      @posts = array_page(Post.find_by(prefecture_id: 25))
    when '26'
      @posts = array_page(Post.find_by(prefecture_id: 26))
    when '27'
      @posts = array_page(Post.find_by(prefecture_id: 27))
    when '28'
      @posts = array_page(Post.find_by(prefecture_id: 28))
    when '29'
      @posts = array_page(Post.find_by(prefecture_id: 29))
    when '30'
      @posts = array_page(Post.find_by(prefecture_id: 30))
    when '31'
      @posts = array_page(Post.find_by(prefecture_id: 31))
    when '32'
      @posts = array_page(Post.find_by(prefecture_id: 32))
    when '33'
      @posts = array_page(Post.find_by(prefecture_id: 33))
    when '34'
      @posts = array_page(Post.find_by(prefecture_id: 34))
    when '35'
      @posts = array_page(Post.find_by(prefecture_id: 35))
    when '36'
      @posts = array_page(Post.find_by(prefecture_id: 36))
    when '37'
      @posts = array_page(Post.find_by(prefecture_id: 37))
    when '38'
      @posts = array_page(Post.find_by(prefecture_id: 38))
    when '39'
      @posts = array_page(Post.find_by(prefecture_id: 39))
    when '40'
      @posts = array_page(Post.find_by(prefecture_id: 40))
    when '41'
      @posts = array_page(Post.find_by(prefecture_id: 41))
    when '42'
      @posts = array_page(Post.find_by(prefecture_id: 42))
    when '43'
      @posts = array_page(Post.find_by(prefecture_id: 43))
    when '44'
      @posts = array_page(Post.find_by(prefecture_id: 44))
    when '45'
      @posts = array_page(Post.find_by(prefecture_id: 45))
    when '46'
      @posts = array_page(Post.find_by(prefecture_id: 46))
    when '47'
      @posts = array_page(Post.find_by(prefecture_id: 47))
    end
  end
end
