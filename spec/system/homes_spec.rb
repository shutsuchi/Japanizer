require 'rails_helper'

describe 'HOME-TEST', type: :system do
  before do
  end
  describe '# TOP-page-test' do
    before do
      visit top_path
    end
    context 'for links(main)' do
      context 'check contents' do
        it 'contains a title' do
          expect(page).to have_content(I18n.t('homes.top.title_text'))
        end
        it 'contains a desctiption' do
          expect(page).to have_content(I18n.t('homes.top.title_description'))
        end
        it 'contains a title_text' do
          expect(page).to have_content(I18n.t('homes.top.subtitle_1'))
        end
        it 'contains a subtitle_1' do
          expect(page).to have_content(I18n.t('homes.top.subtitle_1'))
        end
        it 'contains a data_title' do
          expect(page).to have_content(I18n.t('homes.top.data_title'))
        end
        it 'contains a data_text' do
          expect(page).to have_content(I18n.t('homes.top.data_text_1'))
        end
        it 'contains a data_text2' do
          expect(page).to have_content(I18n.t('homes.top.data_text_2'))
        end
        it 'contains a data_text3' do
          expect(page).to have_content(I18n.t('homes.top.data_text_3'))
        end
        it 'contains a budget_title' do
          expect(page).to have_content(I18n.t('homes.top.budget_title'))
        end
        it 'contains a budget_text' do
          expect(page).to have_content(I18n.t('homes.top.budget_text_1'))
        end
        it 'contains a budget_text2' do
          expect(page).to have_content(I18n.t('homes.top.budget_text_2'))
        end
        it 'contains a budget_text3' do
          expect(page).to have_content(I18n.t('homes.top.budget_text_3'))
        end
        it 'contains a genre_title' do
          expect(page).to have_content(I18n.t('homes.top.genre_title'))
        end
        it 'contains a genre_text' do
          expect(page).to have_content(I18n.t('homes.top.genre_text_1'))
        end
        it 'contains a genre_text2' do
          expect(page).to have_content(I18n.t('homes.top.genre_text_2'))
        end
        it 'contains a genre_text3' do
          expect(page).to have_content(I18n.t('homes.top.genre_text_3'))
        end
        it 'contains a area_title' do
          expect(page).to have_content(I18n.t('homes.top.area_title'))
        end
        it 'contains a area_text' do
          expect(page).to have_content(I18n.t('homes.top.area_text_1'))
        end
        it 'contains a area_text2' do
          expect(page).to have_content(I18n.t('homes.top.area_text_2'))
        end
        it 'contains a area_text3' do
          expect(page).to have_content(I18n.t('homes.top.area_text_3'))
        end
        it 'contains a age_title' do
          expect(page).to have_content(I18n.t('homes.top.age_title'))
        end
        it 'contains a age_text' do
          expect(page).to have_content(I18n.t('homes.top.age_text_1'))
        end
        it 'contains a age_text2' do
          expect(page).to have_content(I18n.t('homes.top.age_text_2'))
        end
        it 'contains a age_text3' do
          expect(page).to have_content(I18n.t('homes.top.age_text_3'))
        end
        it 'contains a nation_title' do
          expect(page).to have_content(I18n.t('homes.top.nation_title'))
        end
        it 'contains a nation_text' do
          expect(page).to have_content(I18n.t('homes.top.nation_text_1'))
        end
        it 'contains a nation_text2' do
          expect(page).to have_content(I18n.t('homes.top.nation_text_2'))
        end
        it 'contains a nation_text3' do
          expect(page).to have_content(I18n.t('homes.top.nation_text_3'))
        end
      end
      context 'check links' do
        it 'contains a data-page link' do
          expect(page).to have_link I18n.t('homes.top.data_title'), href: '/ja/data'
        end
        it 'contains a budget-page link' do
          expect(page).to have_link I18n.t('homes.top.budget_title'), href: '/ja/budget'
        end
        it 'contains a genre-page link' do
          expect(page).to have_link I18n.t('homes.top.genre_title'), href: '/ja/genres'
        end
        it 'contains a area-page link' do
          expect(page).to have_link I18n.t('homes.top.area_title'), href: '/ja/prefectures'
        end
        it 'contains a age-page link' do
          expect(page).to have_link I18n.t('homes.top.age_title'), href: '/ja/age'
        end
        it 'contains a nation-page link' do
          expect(page).to have_link I18n.t('homes.top.nation_title'), href: '/ja/nation'
        end
      end
    end
    context 'for rank(sidebar)' do
      context 'check contents' do
        it 'contains a sidebar-title' do
          expect(page).to have_content(I18n.t('homes.top.ranking'))
        end
        it 'contains a rank-link' do
          expect(page).to have_link I18n.t('homes.top.more'), href: '/ja/rank'
        end
        it 'contains a post-like-rank-title' do
          expect(page).to have_content(I18n.t('homes.top.post_like'))
        end
        it 'contains a post-comment-rank-title' do
          expect(page).to have_content(I18n.t('homes.top.post_comment'))
        end
        it 'contains a album-bookmark-rank-title' do
          expect(page).to have_content(I18n.t('homes.top.album_bookmark'))
        end
      end
    end
  end
  describe '# ABOUT-page-test' do
    before do
      visit about_path
    end
    context 'check links' do
      it 'contains a link to top page' do
        expect(page).to have_link '', href: '/ja'
      end
    end
    context 'check contents' do
      it 'contains a app-title' do
        expect(page).to have_content('Japanizer')
      end
      it 'contains a subtitle_1' do
        expect(page).to have_content(I18n.t('homes.about.subtitle_1'))
      end
      it 'contains a (Know)title of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.know'))
      end
      it 'contains a text of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.know_text_1'))
        expect(page).to have_content(I18n.t('homes.about.know_text_2'))
      end
      it 'contains a (compare)title of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.know'))
      end
      it 'contains a text of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.compare_text_1'))
        expect(page).to have_content(I18n.t('homes.about.compare_text_2'))
      end
      it 'contains a (Post)title of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.post'))
      end
      it 'contains a text of what is Japanizer' do
        expect(page).to have_content(I18n.t('homes.about.post_text_1'))
        expect(page).to have_content(I18n.t('homes.about.post_text_2'))
      end
      it 'contains slide caption title activity' do
        expect(page).to have_content(I18n.t('homes.about.activity'))
      end
      it 'contains slide caption text activity' do
        expect(page).to have_content(I18n.t('homes.about.activity_text'))
      end
      it 'contains slide caption title sightseeing' do
        expect(page).to have_content(I18n.t('homes.about.sight'))
      end
      it 'contains slide caption text sightseeing' do
        expect(page).to have_content(I18n.t('homes.about.sight_text'))
      end
      it 'contains slide caption title food' do
        expect(page).to have_content(I18n.t('homes.about.food'))
      end
      it 'contains slide caption text food' do
        expect(page).to have_content(I18n.t('homes.about.food_text'))
      end
    end
  end
end
