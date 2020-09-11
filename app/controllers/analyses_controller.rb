class AnalysesController < ApplicationController
  include Page
  include RankData

  # GET /data
  # data_path
  def data
    # Japanese User Ranking
    posts_jp = Post.eager_load(:user).jp
    albums_jp = Album.eager_load(:user).jp
    @jp_area_ranks = Prefecture.find(pref_rank(posts_jp))
    @jp_genre_ranks = Genre.find(genre_rank(posts_jp))
    @jp_budget_ranks = budget_rank(albums_jp)

    # Other Nationalities User Ranking
    posts = Post.eager_load(:user).other
    albums = Album.eager_load(:user).other
    @others_area_ranks = Prefecture.find(pref_rank(posts))
    @others_genre_ranks = Genre.find(genre_rank(posts))
    @others_budget_ranks = budget_rank(albums)

    # Highcharts
    @jp_10_genre_ranks = Genre.find(genre_rank_10(posts_jp))
    @jp_10_pref_ranks = Prefecture.find(pref_rank_10(posts_jp))
    @others_10_genre_ranks = Genre.find(genre_rank_10(posts))
    @others_10_pref_ranks = Prefecture.find(pref_rank_10(posts))
    locale = params[:locale]
    @jp_genre_data = highchart_g_clc(@jp_10_genre_ranks, locale)
    @jp_genre_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.title(text: t('analyses.data.graph_genre_t'))
      f.series(name: t('analyses.data.graph_genre_n'), data: @jp_genre_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '100px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
    @jp_pref_data = highchart_p_clc(@jp_10_pref_ranks, locale)
    @jp_pref_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.title(text: t('analyses.data.graph_pref_t'))
      f.series(name: t('analyses.data.graph_pref_n'), data: @jp_pref_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
    @jp_budget_data = highchart_b_clc(albums_jp)
    @jp_budget_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.title(text: t('analyses.data.graph_budget_t'))
      f.series(name: t('analyses.data.graph_budget_n'), data: @jp_budget_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
    @chart_globals = LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
        backgroundColor: {
          linearGradient: [0, 0, 500, 500],
          stops: [
            [0, 'rgb(23, 35, 60)'],
            [1, 'rgb(23, 35, 60)']
          ]
        },
        borderWidth: 5,
        plotBackgroundColor: 'rgb(27, 39, 56)',
        plotShadow: true,
        marginBottom: 40,
        marginLeft: 40,
        marginRight: 40
      )
      f.lang(thousandsSep: ',')
      f.colors(['#f7a35c', '#8085e9', '#f15c80', '#90ed7d', '#e4d354'])
      f.title(
        style: { 'color': '#fff', 'font-size': '25px' },
        align: 'center',
        widthAdjust: '-20'
      )
    end
    @others_genre_data = highchart_g_clc(@others_10_genre_ranks, locale)
    @others_genre_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.colors(['#4682B4', '#2E8B57', '#e4d354'])
      f.title(text: t('analyses.data.graph_genre_t'))
      f.series(name: t('analyses.data.graph_genre_n'), data: @others_genre_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '100px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
    @others_pref_data = highchart_p_clc(@others_10_pref_ranks, locale)
    @others_pref_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.colors(['#4682B4', '#2E8B57', '#e4d354'])
      f.title(text: t('analyses.data.graph_pref_t'))
      f.series(name: t('analyses.data.graph_pref_n'), data: @others_pref_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '100px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
    @others_budget_data = highchart_b_clc(albums)
    @others_budget_graph = LazyHighCharts::HighChart.new('pie') do |f|
      f.chart({ defaultSeriesType: 'pie', margin: [50, 200, 60, 170] })
      f.colors(['#4682B4', '#2E8B57', '#e4d354'])
      f.title(text: t('analyses.data.graph_budget_t'))
      f.series(name: t('analyses.data.graph_budget_n'), data: @others_budget_data, type: 'pie')
      f.legend(align: 'right', layout: 'vertical', style: { left: 'auto', bottom: 'auto', right: '50px', top: '100px' })
      f.plot_options(pie: { allowPointSelect: true, cursor: 'pointer', dataLabels: { enabled: true, color: 'white', style: { fontSize: '15px', font: '33px Trebuchet MS, Verdana, sans-serif' } } })
    end
  end

  # GET /rank
  # rank_path
  def rank
    @genres = Genre.where.not(id: 1).all
    @posts = page_8(Post)
    @albums = page_8(Album)

    # Ranking
    # --- Post-Like Ranking
    @post_like_ranks = Post.find(post_rank(Like))
    # --- Post-Comment
    @post_comment_ranks = Post.find(post_rank(PostComment))
    # --- Album-Bookmark
    @album_bookmark_ranks = Album.find(album_rank(Bookmark))
  end

end
