module RankData
  extend ActiveSupport::Concern

  def pref_rank(obj)
    obj.group(:prefecture_id).order(Arel.sql('count(prefecture_id) desc')).limit(3).pluck(:prefecture_id)
  end

  def genre_rank(obj)
    obj.group(:genre_id).order(Arel.sql('count(genre_id) desc')).limit(3).pluck(:genre_id)
  end

  def budget_rank(obj)
    obj.group(:budget).order(Arel.sql('count(budget) desc')).limit(3).pluck(:budget)
  end

  def post_rank(obj)
    obj.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(5).pluck(:post_id)
  end

  def album_rank(obj)
    obj.group(:album_id).order(Arel.sql('count(album_id) desc')).limit(5).pluck(:album_id)
  end

  def post_first(obj)
    obj.group(:post_id).order(Arel.sql('count(post_id) desc')).limit(1).pluck(:post_id)
  end

  def album_first(obj)
    obj.group(:album_id).order(Arel.sql('count(album_id) desc')).limit(1).pluck(:album_id)
  end

  def pref_rank_10(obj)
    obj.group(:prefecture_id).order(Arel.sql('count(prefecture_id) desc')).limit(3).pluck(:prefecture_id)
  end

  def genre_rank_10(obj)
    obj.group(:genre_id).order(Arel.sql('count(genre_id) desc')).limit(3).pluck(:genre_id)
  end

  def highchart_g_clc(obj, locale)
    genres = []
    obj.each do |genre|
      en_name = genre.en_name
      name = genre.name
      count = genre.posts.count
      genres.push([name, en_name, count])
    end
    n = 0
    c_all = 0
    while n < 3
      c_all += genres[n][2]
      n += 1
    end
    rate0 = (genres[0][2].to_f / c_all * 100).round
    rate1 = (genres[1][2].to_f / c_all * 100).round
    rate2 = (genres[2][2].to_f / c_all * 100).round
    case locale
    when 'ja'
      name0 = genres[0][0]
      name1 = genres[1][0]
      name2 = genres[2][0]
    when 'en'
      name0 = genres[0][1]
      name1 = genres[1][1]
      name2 = genres[2][1]
    end
    @data = [[name0, rate0], [name1, rate1], [name2, rate2]]
  end

  def highchart_p_clc(obj, locale)
    prefs = []
    obj.each do |pref|
      en_name = pref.en_name
      name = pref.name
      count = pref.posts.count
      prefs.push([name, en_name, count])
    end
    n = 0
    c_all = 0
    while n < 3
      c_all += prefs[n][2]
      n += 1
    end
    rate0 = (prefs[0][2].to_f / c_all * 100).round
    rate1 = (prefs[1][2].to_f / c_all * 100).round
    rate2 = (prefs[2][2].to_f / c_all * 100).round
    case locale
    when 'ja'
      name0 = prefs[0][0]
      name1 = prefs[1][0]
      name2 = prefs[2][0]
    when 'en'
      name0 = prefs[0][1]
      name1 = prefs[1][1]
      name2 = prefs[2][1]
    end
    @data = [[name0, rate0], [name1, rate1], [name2, rate2]]
  end

  def highchart_b_clc(obj)
    album = obj.group(:budget).order(Arel.sql('count(budget) desc')).pluck(:budget)
    first = album.first
    second = album.second
    third = album.third
    c1 = Album.all.where(budget: first).count
    c2 = Album.all.where(budget: second).count
    c3 = Album.all.where(budget: third).count
    c_all = c1 + c2 + c3

    rate0 = (c1.to_f / c_all * 100).round
    rate1 = (c2.to_f / c_all * 100).round
    rate2 = (c3.to_f / c_all * 100).round
    @data = [[first, rate0], [second, rate1], [third, rate2]]
  end
end
