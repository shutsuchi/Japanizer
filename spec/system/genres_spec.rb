require 'rails_helper'

describe 'GENRE-TEST' do
  describe '# GENRE-page-test' do
    context 'check contents' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.index.')
      end
      it 'contains a page-subtitle' do
        expect(page).to have_content I18n.t('genres.index.')
      end
      it 'contains a ranking-list-title' do
        expect(page).to have_content I18n.t('genres.index.')
      end
      it 'contains a icon-text-date' do
        expect(page).to have_content I18n.t('genres.index.date')
      end
      it 'contains a icon-text-solo' do
        expect(page).to have_content I18n.t('genres.index.alone')
      end
      it '' do
      end
      it 'contains post-tab-text' do
      end
      it 'contains post-tab-title' do
      end
      it 'contains album-tab-text' do
      end
      it 'contains album-tab-title' do
      end
    end
    context 'check links' do
      it '' do
      end
    end
    context 'check icons' do
      it '' do
      end
    end
  end
  describe '# BUDGET-page-test' do
  end
  describe '# AGE-page-test' do
  end
  describe '# NATION-page-test' do
  end
end
