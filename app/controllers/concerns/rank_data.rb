module RankData
  extend ActiveSupport::Concern

  def pref_rank(obj)
    obj.group(:prefecture_id).order('count(prefecture_id) desc').limit(3).pluck(:prefecture_id)
  end

  def genre_rank(obj)
    obj.group(:genre_id).order('count(genre_id) desc').limit(3).pluck(:genre_id)
  end

  def budget_rank(obj)
    obj.group(:budget).order('count(budget) desc').limit(3).pluck(:budget)
  end

  def post_rank(obj)
    obj.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id)
  end

  def album_rank(obj)
    obj.group(:album_id).order('count(album_id) desc').limit(5).pluck(:album_id)
  end

  def post_first(obj)
    obj.group(:post_id).order('count(post_id) desc').limit(1).pluck(:post_id)
  end

  def album_first(obj)
    obj.group(:album_id).order('count(album_id) desc').limit(1).pluck(:album_id)
  end

end
