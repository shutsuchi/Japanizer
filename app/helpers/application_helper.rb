module ApplicationHelper
  def i18n_url_for(options)
    return unless options[:locale] == I18n.default_locale

    options[:locale] = nil
    # url_for(options)
  end

  def time_fmt(time)
    time.strftime('%Y/%m/%d')
  end

  def ja_time_fmt(time)
    time.in_time_zone('Tokyo').strftime('%Y/%m/%d')
  end

  def hour_fmt(time)
    time.strftime('%Y/%m/%d %H:%M')
  end

  def ja_hour_fmt(time)
    time.in_time_zone('Tokyo').strftime('%Y/%m/%d %H:%M')
  end
end
