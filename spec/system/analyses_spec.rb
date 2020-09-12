require 'rails_helper'

describe 'ANALYSES-TEST', type: :system do
  describe '# DATA-page-test' do
    let(:post){ (create(:post)) }
    let(:album){ (create(:album)) }
    let(:genre){ (create(:genre)) }
    let(:prefecture){ (create(:prefecture)) }
    before do
      # visit data_path
    end
    context 'check page-contents' do
      it 'contains a title' do
        # expect(page).to have_content I18n.t('analyses.data.title')
      end
      it 'contains a jp-rank-subtitle' do
        # expect(page).to have_content I18n.t('analyses.data.subtitle_jp')
      end
      it 'contains a other-rank-subtitle' do
        # expect(page).to have_content I18n.t('analyses.data.subtitle_ot')
      end
      it 'contains a genre-rank-subtitle' do
        # expect(page).to have_content I18n.t('analyses.data.genre_rank')
      end
      it 'contains a budget-rank-subtitle' do
        # expect(page).to have_content I18n.t('analyses.data.budget_rank')
      end
    end
  end
  describe '# RANK-page-test' do
    before do
      visit rank_path
    end
    context 'check page-contents' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('analyses.rank.pagetitle')
      end
      it 'contains a page-subtitle' do
        expect(page).to have_content I18n.t('analyses.rank.subtitle')
      end
      it 'contains a like-ranking' do
        expect(page).to have_content I18n.t('analyses.rank.like')
      end
      it 'contains a comment-ranking' do
        expect(page).to have_content I18n.t('analyses.rank.comment')
      end
      it 'contains a bookmark-ranking' do
        expect(page).to have_content I18n.t('analyses.rank.bookmark')
      end
    end
  end
end
