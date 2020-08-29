require 'rails_helper'

describe 'GENRE-TEST', type: :system do
  describe '# GENRE-page-test' do
    before do
      visit genres_path
    end
    let(:genre) { create(:genre, id: 1) }
    let(:genre2) { create(:genre, id: 2) }
    let(:genre3) { create(:genre, id: 3) }
    context 'check contents' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.index.pagetitle')
      end
      it 'contains a page-description' do
        expect(page).to have_content I18n.t('genres.index.description')
      end
      it 'contains a other pages suggestion' do
        expect(page).to have_content I18n.t('app.link.both')
      end
      it 'contains a page-subtitle' do
        expect(page).to have_content I18n.t('genres.index.subtitle')
      end
      it 'contains post-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_p')
      end
      it 'contains album-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_a')
      end
    end
    context 'check links' do
      it 'contains a link to prefectures_path' do
        expect(page).to have_link I18n.t('app.link.area'), href: '/ja/prefectures'
      end
      it 'contains a link to budget_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
      end
      it 'contains a link to age_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
      end
      it 'contains a link to nation_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
      end
    end
  end
  describe '# BUDGET-page-test' do
    before do
      visit budget_path
    end
    context 'check contents' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.budget.pagetitle')
      end
      it 'contains a page-description' do
        expect(page).to have_content I18n.t('genres.budget.description')
      end
      it 'contains a other pages suggestion' do
        expect(page).to have_content I18n.t('app.link.both')
      end
      it 'contains a album-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_a')
      end
    end
    context 'check links' do
      it 'contains a link to prefectures_path' do
        expect(page).to have_link I18n.t('app.link.area'), href: '/ja/prefectures'
      end
      it 'contains a link to genres_path' do
        expect(page).to have_link I18n.t('app.link.genre'), href: '/ja/genres'
      end
      it 'contains a link to age_path' do
        expect(page).to have_link I18n.t('app.link.age'), href: '/ja/age'
      end
      it 'contains a link to nation_path' do
        expect(page).to have_link I18n.t('app.link.nation'), href: '/ja/nation'
      end
      it 'contains a link with parameter - under' do
        expect(page).to have_link I18n.t('genres.budget.under'), href: '/ja/budget?budget_range=1'
      end
      it 'contains a link with parameter - yen_3' do
        expect(page).to have_link I18n.t('genres.budget.yen_3'), href: '/ja/budget?budget_range=2'
      end
      it 'contains a link with parameter - yen_5' do
        expect(page).to have_link I18n.t('genres.budget.yen_5'), href: '/ja/budget?budget_range=3'
      end
      it 'contains a link with parameter - yen_7' do
        expect(page).to have_link I18n.t('genres.budget.yen_7'), href: '/ja/budget?budget_range=4'
      end
      it 'contains a link with parameter - yen_9' do
        expect(page).to have_link I18n.t('genres.budget.yen_9'), href: '/ja/budget?budget_range=5'
      end
      it 'contains a link with parameter - yen_20' do
        expect(page).to have_link I18n.t('genres.budget.yen_20'), href: '/ja/budget?budget_range=6'
      end
      it 'contains a link with parameter - yen_30' do
        expect(page).to have_link I18n.t('genres.budget.yen_30'), href: '/ja/budget?budget_range=7'
      end
      it 'contains a link with parameter - yen_40' do
        expect(page).to have_link I18n.t('genres.budget.yen_40'), href: '/ja/budget?budget_range=8'
      end
      it 'contains a link with parameter - yen_50' do
        expect(page).to have_link I18n.t('genres.budget.yen_50'), href: '/ja/budget?budget_range=9'
      end
      it 'contains a link with parameter - over' do
        expect(page).to have_link I18n.t('genres.budget.over'), href: '/ja/budget?budget_range=10'
      end
    end
    context 'check functions' do
      context 'when click the link of other pages' do
        it 'transits to the page of prefectures_path' do
          click_link I18n.t('app.link.area')
          expect(current_path).to eq '/ja/prefectures'
        end
        it 'transits to the page of genres_path' do
          click_link I18n.t('app.link.genre')
          expect(current_path).to eq '/ja/genres'
        end
        it 'transits to the page of age_path' do
          click_link I18n.t('app.link.age')
          expect(current_path).to eq '/ja/age'
        end
        it 'transits to the page of nation_path' do
          click_link I18n.t('app.link.nation')
          expect(current_path).to eq '/ja/nation'
        end
      end
      context 'when click the link of parameter' do
        it 'changes the page - under' do
          click_link I18n.t('genres.budget.under')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=1'
        end
        it 'changes the page - yen_3' do
          click_link I18n.t('genres.budget.yen_3')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=2'
        end
        it 'changes the page - yen_5' do
          click_link I18n.t('genres.budget.yen_5')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=3'
        end
        it 'changes the page - yen_7' do
          click_link I18n.t('genres.budget.yen_7')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=4'
        end
        it 'changes the page - yen_9' do
          click_link I18n.t('genres.budget.yen_9')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=5'
        end
        it 'changes the page - yen_20' do
          click_link I18n.t('genres.budget.yen_20')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=6'
        end
        it 'changes the page - yen_30' do
          click_link I18n.t('genres.budget.yen_30')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=7'
        end
        it 'changes the page - yen_40' do
          click_link I18n.t('genres.budget.yen_40')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=8'
        end
        it 'changes the page - yen_50' do
          click_link I18n.t('genres.budget.yen_50')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=9'
        end
        it 'changes the page - over' do
          click_link I18n.t('genres.budget.over')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/budget?budget_range=10'
        end
      end
      context 'icon changes when click the link of parameters' do
        it 'contains a default icon' do
          expect(page).to have_css '.budget-icon__default'
        end
        it 'contains a question icon' do
          expect(page).to have_css '.budget-icon__question'
        end
        it 'changes into  a under icon' do
          click_link I18n.t('genres.budget.under')
          expect(page).to have_css '.budget-icon__1'
        end
        it 'changes into  a yen_3 icon' do
          click_link I18n.t('genres.budget.yen_3')
          expect(page).to have_css '.budget-icon__2'
        end
        it 'changes into  a yen_5 icon' do
          click_link I18n.t('genres.budget.yen_5')
          expect(page).to have_css '.budget-icon__3'
        end
        it 'changes into  a yen_7 icon' do
          click_link I18n.t('genres.budget.yen_7')
          expect(page).to have_css '.budget-icon__4'
        end
        it 'changes into  a yen_9 icon' do
          click_link I18n.t('genres.budget.yen_9')
          expect(page).to have_css '.budget-icon__5'
        end
        it 'changes into  a yen_20 icon' do
          click_link I18n.t('genres.budget.yen_20')
          expect(page).to have_css '.budget-icon__6'
        end
        it 'changes into  a yen_30 icon' do
          click_link I18n.t('genres.budget.yen_30')
          expect(page).to have_css '.budget-icon__7'
        end
        it 'changes into  a yen_40 icon' do
          click_link I18n.t('genres.budget.yen_40')
          expect(page).to have_css '.budget-icon__8'
        end
        it 'changes into  a yen_50 icon' do
          click_link I18n.t('genres.budget.yen_50')
          expect(page).to have_css '.budget-icon__9'
        end
        it 'changes into  a over icon' do
          click_link I18n.t('genres.budget.over')
          expect(page).to have_css '.budget-icon__10'
        end
      end
    end
  end
  describe '# AGE-page-test' do
    before do
      visit age_path
    end
    context 'check contains' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.age.pagetitle')
      end
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.age.description')
      end
      it 'contains a other pages suggestion' do
        expect(page).to have_content I18n.t('app.link.both')
      end
      it 'contains a post-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_p')
      end
      it 'contains a album-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_a')
      end
    end
    context 'check links' do
      it 'contains a link to prefectures_path' do
        expect(page).to have_link I18n.t('app.link.area'), href: '/ja/prefectures'
      end
      it 'contains a link to genres_path' do
        expect(page).to have_link I18n.t('app.link.genre'), href: '/ja/genres'
      end
      it 'contains a link to budget_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
      end
      it 'contains a link to nation_path' do
        expect(page).to have_link I18n.t('app.link.nation'), href: '/ja/nation'
      end
      it 'contains a link with parameter - age_20' do
        expect(page).to have_link I18n.t('genres.age.age_20'), href: '/ja/age?age_range=1'
      end
      it 'contains a link with parameter - age_30' do
        expect(page).to have_link I18n.t('genres.age.age_30'), href: '/ja/age?age_range=2'
      end
      it 'contains a link with parameter - age_40' do
        expect(page).to have_link I18n.t('genres.age.age_40'), href: '/ja/age?age_range=3'
      end
      it 'contains a link with parameter - age_50' do
        expect(page).to have_link I18n.t('genres.age.age_50'), href: '/ja/age?age_range=4'
      end
      it 'contains a link with parameter - age_60' do
        expect(page).to have_link I18n.t('genres.age.age_60'), href: '/ja/age?age_range=5'
      end
      it 'contains a link with parameter - age_70' do
        expect(page).to have_link I18n.t('genres.age.age_70'), href: '/ja/age?age_range=6'
      end
      it 'contains a link with parameter - age_80' do
        expect(page).to have_link I18n.t('genres.age.age_80'), href: '/ja/age?age_range=7'
      end
      it 'contains a link with parameter - all' do
        expect(page).to have_link I18n.t('genres.age.all'), href: '/ja/age'
      end
    end
    context 'check functions' do
      context 'when click the link of other pages' do
        it 'transits to the page of prefectures_path' do
          click_link I18n.t('app.link.area')
          expect(current_path).to eq '/ja/prefectures'
        end
        it 'transits to the page of genres_path' do
          click_link I18n.t('app.link.genre')
          expect(current_path).to eq '/ja/genres'
        end
        it 'transits to the page of budget_path' do
          click_link I18n.t('app.link.budget')
          expect(current_path).to eq '/ja/budget'
        end
        it 'transits to the page of nation_path' do
          click_link I18n.t('app.link.nation')
          expect(current_path).to eq '/ja/nation'
        end
      end
      context 'when click the link of parameters' do
        it 'changes the page - age20' do
          click_link I18n.t('genres.age.age_20')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=1'
        end
        it 'changes the page - age30' do
          click_link I18n.t('genres.age.age_30')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=2'
        end
        it 'changes the page - age40' do
          click_link I18n.t('genres.age.age_40')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=3'
        end
        it 'changes the page - age50' do
          click_link I18n.t('genres.age.age_50')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=4'
        end
        it 'changes the page - age60' do
          click_link I18n.t('genres.age.age_60')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=5'
        end
        it 'changes the page - age70' do
          click_link I18n.t('genres.age.age_70')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=6'
        end
        it 'changes the page - age80' do
          click_link I18n.t('genres.age.age_80')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?age_range=7'
        end
        it 'changes the page - allage' do
          click_link I18n.t('genres.age.all')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/age?'
        end
      end
      context 'icon changes when click the link of parameters' do
        it 'contains a default icon' do
          expect(page).to have_css '.age-icon__default'
        end
        it 'changes into a age_20 icon' do
          click_link I18n.t('genres.age.age_20')
          expect(page).to have_css '.age-icon__1'
        end
        it 'changes into a age_30 icon' do
          click_link I18n.t('genres.age.age_30')
          expect(page).to have_css '.age-icon__2'
        end
        it 'changes into a age_40 icon' do
          click_link I18n.t('genres.age.age_40')
          expect(page).to have_css '.age-icon__3'
        end
        it 'changes into a age_50 icon' do
          click_link I18n.t('genres.age.age_50')
          expect(page).to have_css '.age-icon__4'
        end
        it 'changes into a age_60 icon' do
          click_link I18n.t('genres.age.age_60')
          expect(page).to have_css '.age-icon__5'
        end
        it 'changes into a age_70 icon' do
          click_link I18n.t('genres.age.age_70')
          expect(page).to have_css '.age-icon__6'
        end
        it 'changes into a age_80 icon' do
          click_link I18n.t('genres.age.age_80')
          expect(page).to have_css '.age-icon__7'
        end
        it 'changes into a all-age icon' do
          click_link I18n.t('genres.age.all')
          expect(page).to have_css '.age-icon__default'
        end
      end
    end
  end
  describe '# NATION-page-test' do
    before do
      visit nation_path
    end
    context 'check contains' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('genres.nation.pagetitle')
      end
      it 'contains a page-description' do
        expect(page).to have_content I18n.t('genres.nation.description')
      end
      it 'contains a other pages suggestion' do
        expect(page).to have_content I18n.t('app.link.both')
      end
      it 'contains a post-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_p')
      end
      it 'contains a album-tab-title' do
        expect(page).to have_content I18n.t('genres.subtitle_a')
      end
    end
    context 'check links' do
      it 'contains a link to prefectures_path' do
        expect(page).to have_link I18n.t('app.link.area'), href: '/ja/prefectures'
      end
      it 'contains a link to genres_path' do
        expect(page).to have_link I18n.t('app.link.genre'), href: '/ja/genres'
      end
      it 'contains a link to age_path' do
        expect(page).to have_link I18n.t('app.link.age'), href: '/ja/age'
      end
      it 'contains a link to budget_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
      end
    end
    context 'check functions' do
      context 'when click the link of other pages' do
        it 'transits to the page of prefectures_path' do
          click_link I18n.t('app.link.area')
          expect(current_path).to eq '/ja/prefectures'
        end
        it 'transits to the page of genres_path' do
          click_link I18n.t('app.link.genre')
          expect(current_path).to eq '/ja/genres'
        end
        it 'transits to the page of age_path' do
          click_link I18n.t('app.link.age')
          expect(current_path).to eq '/ja/age'
        end
        it 'transits to the page of budget_path' do
          click_link I18n.t('app.link.budget')
          expect(current_path).to eq '/ja/budget'
        end
      end
      context 'when click the link of parameters' do
        it 'changes the page - japanese' do
          click_link I18n.t('genres.nation.jp')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/nation?nation=1'
        end
        it 'changes the page - other' do
          click_link I18n.t('genres.nation.other')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/nation?nation=2'
        end
      end
      context 'icon changes when click the link of parameters' do
        it 'contains a default icon' do
          expect(page).to have_css '.nation-icon__default'
        end
        it 'changes into a japanese icon' do
          click_link I18n.t('genres.nation.jp')
          expect(page).to have_css '.nation-icon__1'
        end
        it 'changes into a other nationalities icon' do
          click_link I18n.t('genres.nation.other')
          expect(page).to have_css '.nation-icon__2'
        end
      end
    end
  end
end
