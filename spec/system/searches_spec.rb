require 'rails_helper'

describe 'SEARCH-TEST', type: :system do
  describe '# SEARCHBAR-test' do
    context 'check contents' do
    end
    context 'check functions' do
    end
  end
  describe '# INDEX-page-test' do
    context 'when search for post' do
      before do
        visit top_path
        click_on 'button'
      end
      context 'check contents' do
        it 'contains a page title' do
          expect(page).to have_content I18n.t('searches.title')
        end
        it 'contains a search-condition-text' do
          expect(page).to have_content I18n.t('searches.condition')
        end
        it 'contains a condition-subtitle' do
          expect(page).to have_content I18n.t('searches.subtitle_post')
        end
        it 'contains a condition of time' do
          expect(page).to have_content I18n.t('searches.any_time')
        end
        it 'contains a condition of nationalities' do
          expect(page).to have_content I18n.t('searches.nation_all')
        end
      end
    end
    context 'when search for album' do
      before do
        visit top_path
        obj_el = find('#option > option:nth-child(1)').text
        select(obj_el, from: 'option')
        gen_el = find('#genre > option:nth-child(1)').text
        select(gen_el, from: 'genre')
        tim_el = find('#time > option:nth-child(3)').text
        select(tim_el, from: 'time')
        nat_el = find('#nation > option:nth-child(2)').text
        select(nat_el, from: 'nation')
        click_on 'button'
      end
      context 'check contents' do
        it 'contains a page title' do
        end
        it 'contains a search-condition-text' do
          expect(page).to have_content I18n.t('searches.condition')
        end
        it 'contains a condition-subtitle' do
          expect(page).to have_content I18n.t('searches.subtitle_album')
        end
        it 'contains a condition of time' do
          expect(page).to have_content I18n.t('searches.past_month')
        end
        it 'contains a condition of nationalities' do
          expect(page).to have_content I18n.t('searches.nation_all')
        end
      end
    end
  end
end
