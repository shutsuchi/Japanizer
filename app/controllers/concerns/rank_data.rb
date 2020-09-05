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
    while n < 3 do
      c_all += genres[n][2]
      n += 1
    end
    rate_0 = (genres[0][2].to_f/c_all*100).round
    rate_1 = (genres[1][2].to_f/c_all*100).round
    rate_2 = (genres[2][2].to_f/c_all*100).round
    #rate_3 = (genres[3][2].to_f/c_all*100).round
    #rate_4 = (genres[4][2].to_f/c_all*100).round
    #rate_5 = (genres[5][2].to_f/c_all*100).round
    #rate_6 = (genres[6][2].to_f/c_all*100).round
    #rate_7 = (genres[7][2].to_f/c_all*100).round
    #rate_8 = (genres[8][2].to_f/c_all*100).round
    #rate_9 = (genres[9][2].to_f/c_all*100).round
    case locale
    when 'ja'
      name_0 = genres[0][0]
      name_1 = genres[1][0]
      name_2 = genres[2][0]
      #name_3 = genres[3][0]
      #name_4 = genres[4][0]
      #name_5 = genres[5][0]
      #name_6 = genres[6][0]
      #name_7 = genres[7][0]
      #name_8 = genres[8][0]
      #name_9 = genres[9][0]
    when 'en'
      name_0 = genres[0][1]
      name_1 = genres[1][1]
      name_2 = genres[2][1]
      #name_3 = genres[3][1]
      #name_4 = genres[4][1]
      #name_5 = genres[5][1]
      #name_6 = genres[6][1]
      #name_7 = genres[7][1]
      #name_8 = genres[8][1]
      #name_9 = genres[9][1]
    end
    return data = [[name_0, rate_0],[name_1, rate_1],[name_2, rate_2]]
            #[name_3, rate_3],[name_4, rate_4],[name_5, rate_5],
            #[name_6, rate_6],[name_7, rate_7],[name_8, rate_8],[name_9, rate_9]]
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
    while n < 3 do
      c_all += prefs[n][2]
      n += 1
    end
    rate_0 = (prefs[0][2].to_f/c_all*100).round
    rate_1 = (prefs[1][2].to_f/c_all*100).round
    rate_2 = (prefs[2][2].to_f/c_all*100).round
    case locale
    when 'ja'
      name_0 = prefs[0][0]
      name_1 = prefs[1][0]
      name_2 = prefs[2][0]
    end
    return data = [[name_0, rate_0],[name_1, rate_1],[name_2, rate_2]]
  end
  def highchart_b_clc(obj)
    album = obj.group(:budget).order(Arel.sql('count(budget) desc')).pluck(:budget)
    first = album.first
    second = album.second
    third = album.third
    c_1 = Album.all.where(budget: first).count
    c_2 = Album.all.where(budget: second).count
    c_3 = Album.all.where(budget: third).count
    c_all = c_1 + c_2 + c_3

    rate_0 = (c_1.to_f/c_all*100).round
    rate_1 = (c_2.to_f/c_all*100).round
    rate_2 = (c_3.to_f/c_all*100).round
    return data = [[first, rate_0],[second, rate_1],[third, rate_2]]
  end
end
