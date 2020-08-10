module GenreChoice
  extend ActiveSupport::Concern

  def budget_album(range)
    case range
    when '1'
      @albums_pg = page_6(Album.budget_under)
    when '2'
      @albums_pg = page_6(Album.budget_3)
    when '3'
      @albums_pg = page_6(Album.budget_5)
    when '4'
      @albums_pg = page_6(Album.budget_7)
    when '5'
      @albums_pg = page_6(Album.budget_9)
    when '6'
      @albums_pg = page_6(Album.budget_20)
    when '7'
      @albums_pg = page_6(Album.budget_30)
    when '8'
      @albums_pg = page_6(Album.budget_40)
    when '9'
      @albums_pg = page_6(Album.budget_50)
    when '10'
      @albums_pg = page_6(Album.budget_over)
    else
      @albums_pg = page_6(Album)
    end
  end

  def age_post(range, pg1)
    case range
    when '1'
      @posts_pg = type_page_8(Post.eager_load(:user).age_20, pg1)
    when '2'
      @posts_pg = type_page_8(Post.eager_load(:user).age_30, pg1)
    when '3'
      @posts_pg = type_page_8(Post.eager_load(:user).age_40, pg1)
    when '4'
      @posts_pg = type_page_8(Post.eager_load(:user).age_50, pg1)
    when '5'
      @posts_pg = type_page_8(Post.eager_load(:user).age_60, pg1)
    when '6'
      @posts_pg = type_page_8(Post.eager_load(:user).age_70, pg1)
    when '7'
      @posts_pg = type_page_8(Post.eager_load(:user).age_80, pg1)
    else
      @posts_pg = type_page_8(Post, pg1)
    end
  end

  def age_album(range, pg2)
    case range
    when '1'
      @albums_pg = type_page_6(Album.eager_load(:user).age_20, pg2)
    when '2'
      @albums_pg = type_page_6(Album.eager_load(:user).age_30, pg2)
    when '3'
      @albums_pg = type_page_6(Album.eager_load(:user).age_40, pg2)
    when '4'
      @albums_pg = type_page_6(Album.eager_load(:user).age_50, pg2)
    when '5'
      @albums_pg = type_page_6(Album.eager_load(:user).age_60, pg2)
    when '6'
      @albums_pg = type_page_6(Album.eager_load(:user).age_70, pg2)
    when '7'
      @albums_pg = type_page_6(Album.eager_load(:user).age_80, pg2)
    else
      @albums_pg = type_page_6(Album, pg2)
    end
  end

  def nation_post(nation, pg1)
    case nation
    when '1'
      @posts_pg = type_page_8(Post.eager_load(:user).jp, pg1)
    when '2'
      @posts_pg = type_page_8(Post.eager_load(:user).other, pg1)
    else
      @posts_pg = type_page_8(Post, pg1)
    end
  end

  def nation_album(nation, pg2)
    case nation
    when '1'
      @albums_pg = type_page_6(Album.eager_load(:user).jp, pg2)
    when '2'
      @albums_pg = type_page_6(Album.eager_load(:user).other, pg2)
    else
      @albums_pg = type_page_6(Album, pg2)
    end
  end

end
