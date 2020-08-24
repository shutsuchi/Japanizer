require 'rails_helper'

describe 'PREFECTURE-TEST', type: :system do
  describe '# INDEX-page-test' do
    before do
      visit prefectures_path
    end
    context 'check contents' do
      it 'contains a page-title' do
        expect(page).to have_content I18n.t('prefectures.index.pagetitle')
      end
      it 'contains a page-description' do
        expect(page).to have_content I18n.t('prefectures.index.description')
      end
      it 'contains a other pages suggestion' do
        expect(page).to have_content I18n.t('app.link.both')
      end
      it 'contains a post-tab-title' do
        expect(page).to have_content I18n.t('prefectures.index.post_index')
      end
    end
    context 'check links' do
      it 'contains a link to budget_path' do
        expect(page).to have_link I18n.t('app.link.budget'), href: '/ja/budget'
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
      it 'contains a link with parameter - area_1' do
        expect(page).to have_link I18n.t('prefectures.index.hokkaido_area'), href: '/ja/prefectures?area_id=1'
      end
      it 'contains a link with parameter - area_2' do
        expect(page).to have_link I18n.t('prefectures.index.tohoku_area'), href: '/ja/prefectures?area_id=2'
      end
      it 'contains a link with parameter - area_3' do
        expect(page).to have_link I18n.t('prefectures.index.hokuriku_area'), href: '/ja/prefectures?area_id=3'
      end
      it 'contains a link with parameter - area_4' do
        expect(page).to have_link I18n.t('prefectures.index.kanto_area'), href: '/ja/prefectures?area_id=4'
      end
      it 'contains a link with parameter - area_5' do
        expect(page).to have_link I18n.t('prefectures.index.tokai_area'), href: '/ja/prefectures?area_id=5'
      end
      it 'contains a link with parameter - area_6' do
        expect(page).to have_link I18n.t('prefectures.index.kinki_area'), href: '/ja/prefectures?area_id=6'
      end
      it 'contains a link with parameter - area_7' do
        expect(page).to have_link I18n.t('prefectures.index.chugoku_area'), href: '/ja/prefectures?area_id=7'
      end
      it 'contains a link with parameter - area_8' do
        expect(page).to have_link I18n.t('prefectures.index.shikoku_area'), href: '/ja/prefectures?area_id=8'
      end
      it 'contains a link with parameter - area_9' do
        expect(page).to have_link I18n.t('prefectures.index.kyushu_area'), href: '/ja/prefectures?area_id=9'
      end
      it 'contains a link with parameter - area_10' do
        expect(page).to have_link I18n.t('prefectures.index.okinawa_area'), href: '/ja/prefectures?area_id=10'
      end
      it 'contains a link with parameter - pref_1' do
        expect(page).to have_link I18n.t('prefectures.index.hokkaido'), href: '/ja/prefectures?pref_id=1'
      end
      it 'contains a link with parameter - pref_2' do
        expect(page).to have_link I18n.t('prefectures.index.aomori'), href: '/ja/prefectures?pref_id=2'
      end
      it 'contains a link with parameter - pref_3' do
        expect(page).to have_link I18n.t('prefectures.index.iwate'), href: '/ja/prefectures?pref_id=3'
      end
      it 'contains a link with parameter - pref_4' do
        expect(page).to have_link I18n.t('prefectures.index.miyagi'), href: '/ja/prefectures?pref_id=4'
      end
      it 'contains a link with parameter - pref_5' do
        expect(page).to have_link I18n.t('prefectures.index.akita'), href: '/ja/prefectures?pref_id=5'
      end
      it 'contains a link with parameter - pref_6' do
        expect(page).to have_link I18n.t('prefectures.index.yamagata'), href: '/ja/prefectures?pref_id=6'
      end
      it 'contains a link with parameter - pref_7' do
        expect(page).to have_link I18n.t('prefectures.index.fukushima'), href: '/ja/prefectures?pref_id=7'
      end
      it 'contains a link with parameter - pref_8' do
        expect(page).to have_link I18n.t('prefectures.index.ibaraki'), href: '/ja/prefectures?pref_id=8'
      end
      it 'contains a link with parameter - pref_9' do
        expect(page).to have_link I18n.t('prefectures.index.tochigi'), href: '/ja/prefectures?pref_id=9'
      end
      it 'contains a link with parameter - pref_10' do
        expect(page).to have_link I18n.t('prefectures.index.gunma'), href: '/ja/prefectures?pref_id=10'
      end
      it 'contains a link with parameter - pref_11' do
        expect(page).to have_link I18n.t('prefectures.index.saitama'), href: '/ja/prefectures?pref_id=11'
      end
      it 'contains a link with parameter - pref_12' do
        expect(page).to have_link I18n.t('prefectures.index.chiba'), href: '/ja/prefectures?pref_id=12'
      end
      it 'contains a link with parameter - pref_13' do
        expect(page).to have_link I18n.t('prefectures.index.tokyo'), href: '/ja/prefectures?pref_id=13'
      end
      it 'contains a link with parameter - pref_14' do
        expect(page).to have_link I18n.t('prefectures.index.kanagawa'), href: '/ja/prefectures?pref_id=14'
      end
      it 'contains a link with parameter - pref_15' do
        expect(page).to have_link I18n.t('prefectures.index.niigata'), href: '/ja/prefectures?pref_id=15'
      end
      it 'contains a link with parameter - pref_16' do
        expect(page).to have_link I18n.t('prefectures.index.toyama'), href: '/ja/prefectures?pref_id=16'
      end
      it 'contains a link with parameter - pref_17' do
        expect(page).to have_link I18n.t('prefectures.index.ishikawa'), href: '/ja/prefectures?pref_id=17'
      end
      it 'contains a link with parameter - pref_18' do
        expect(page).to have_link I18n.t('prefectures.index.fukui'), href: '/ja/prefectures?pref_id=18'
      end
      it 'contains a link with parameter - pref_19' do
        expect(page).to have_link I18n.t('prefectures.index.yamanashi'), href: '/ja/prefectures?pref_id=19'
      end
      it 'contains a link with parameter - pref_20' do
        expect(page).to have_link I18n.t('prefectures.index.nagano'), href: '/ja/prefectures?pref_id=20'
      end
      it 'contains a link with parameter - pref_21' do
        expect(page).to have_link I18n.t('prefectures.index.gifu'), href: '/ja/prefectures?pref_id=21'
      end
      it 'contains a link with parameter - pref_22' do
        expect(page).to have_link I18n.t('prefectures.index.sizuoka'), href: '/ja/prefectures?pref_id=22'
      end
      it 'contains a link with parameter - pref_23' do
        expect(page).to have_link I18n.t('prefectures.index.aichi'), href: '/ja/prefectures?pref_id=23'
      end
      it 'contains a link with parameter - pref_24' do
        expect(page).to have_link I18n.t('prefectures.index.mie'), href: '/ja/prefectures?pref_id=24'
      end
      it 'contains a link with parameter - pref_25' do
        expect(page).to have_link I18n.t('prefectures.index.siga'), href: '/ja/prefectures?pref_id=25'
      end
      it 'contains a link with parameter - pref_26' do
        expect(page).to have_link I18n.t('prefectures.index.kyoto'), href: '/ja/prefectures?pref_id=26'
      end
      it 'contains a link with parameter - pref_27' do
        expect(page).to have_link I18n.t('prefectures.index.osaka'), href: '/ja/prefectures?pref_id=27'
      end
      it 'contains a link with parameter - pref_28' do
        expect(page).to have_link I18n.t('prefectures.index.hyogo'), href: '/ja/prefectures?pref_id=28'
      end
      it 'contains a link with parameter - pref_29' do
        expect(page).to have_link I18n.t('prefectures.index.nara'), href: '/ja/prefectures?pref_id=29'
      end
      it 'contains a link with parameter - pref_30' do
        expect(page).to have_link I18n.t('prefectures.index.wakayama'), href: '/ja/prefectures?pref_id=30'
      end
      it 'contains a link with parameter - pref_31' do
        expect(page).to have_link I18n.t('prefectures.index.tottori'), href: '/ja/prefectures?pref_id=31'
      end
      it 'contains a link with parameter - pref_32' do
        expect(page).to have_link I18n.t('prefectures.index.shimane'), href: '/ja/prefectures?pref_id=32'
      end
      it 'contains a link with parameter - pref_33' do
        expect(page).to have_link I18n.t('prefectures.index.okayama'), href: '/ja/prefectures?pref_id=33'
      end
      it 'contains a link with parameter - pref_34' do
        expect(page).to have_link I18n.t('prefectures.index.hiroshima'), href: '/ja/prefectures?pref_id=34'
      end
      it 'contains a link with parameter - pref_35' do
        expect(page).to have_link I18n.t('prefectures.index.yamaguchi'), href: '/ja/prefectures?pref_id=35'
      end
      it 'contains a link with parameter - pref_36' do
        expect(page).to have_link I18n.t('prefectures.index.tokushima'), href: '/ja/prefectures?pref_id=36'
      end
      it 'contains a link with parameter - pref_37' do
        expect(page).to have_link I18n.t('prefectures.index.kagawa'), href: '/ja/prefectures?pref_id=37'
      end
      it 'contains a link with parameter - pref_38' do
        expect(page).to have_link I18n.t('prefectures.index.ehime'), href: '/ja/prefectures?pref_id=38'
      end
      it 'contains a link with parameter - pref_39' do
        expect(page).to have_link I18n.t('prefectures.index.kochi'), href: '/ja/prefectures?pref_id=39'
      end
      it 'contains a link with parameter - pref_40' do
        expect(page).to have_link I18n.t('prefectures.index.fukuoka'), href: '/ja/prefectures?pref_id=40'
      end
      it 'contains a link with parameter - pref_41' do
        expect(page).to have_link I18n.t('prefectures.index.saga'), href: '/ja/prefectures?pref_id=41'
      end
      it 'contains a link with parameter - pref_42' do
        expect(page).to have_link I18n.t('prefectures.index.nagasaki'), href: '/ja/prefectures?pref_id=42'
      end
      it 'contains a link with parameter - pref_43' do
        expect(page).to have_link I18n.t('prefectures.index.kumamoto'), href: '/ja/prefectures?pref_id=43'
      end
      it 'contains a link with parameter - pref_44' do
        expect(page).to have_link I18n.t('prefectures.index.oita'), href: '/ja/prefectures?pref_id=44'
      end
      it 'contains a link with parameter - pref_45' do
        expect(page).to have_link I18n.t('prefectures.index.miyazaki'), href: '/ja/prefectures?pref_id=45'
      end
      it 'contains a link with parameter - pref_46' do
        expect(page).to have_link I18n.t('prefectures.index.kagoshima'), href: '/ja/prefectures?pref_id=46'
      end
      it 'contains a link with parameter - pref_47' do
        expect(page).to have_link I18n.t('prefectures.index.okinawa'), href: '/ja/prefectures?pref_id=47'
      end
    end
    context 'check functions' do
      context 'when click the link of other pages' do
        it 'transits to the page of budget_path' do
          click_link I18n.t('app.link.budget')
          expect(current_path).to eq '/ja/budget'
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
        it 'change the page - hokkaido area' do
          click_link I18n.t('prefectures.index.hokkaido_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=1'
        end
        it 'change the page - tohoku area' do
          click_link I18n.t('prefectures.index.tohoku_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=2'
        end
        it 'change the page - hokuriku area' do
          click_link I18n.t('prefectures.index.hokuriku_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=3'
        end
        it 'change the page - kanto area' do
          click_link I18n.t('prefectures.index.kanto_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=4'
        end
        it 'change the page - tokai area' do
          click_link I18n.t('prefectures.index.tokai_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=5'
        end
        it 'change the page - kinki area' do
          click_link I18n.t('prefectures.index.kinki_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=6'
        end
        it 'change the page - chugoku area' do
          click_link I18n.t('prefectures.index.chugoku_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=7'
        end
        it 'change the page - shikoku area' do
          click_link I18n.t('prefectures.index.shikoku_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=8'
        end
        it 'change the page - kyushu area' do
          click_link I18n.t('prefectures.index.kyushu_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=9'
        end
        it 'change the page - okinawa area' do
          click_link I18n.t('prefectures.index.okinawa_area'), match: :first
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?area_id=10'
        end
        it 'change the page - hokkaido' do
          click_link I18n.t('prefectures.index.hokkaido')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=1'
        end
        it 'change the page - aomori' do
          click_link I18n.t('prefectures.index.aomori')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=2'
        end
        it 'change the page - iwate' do
          click_link I18n.t('prefectures.index.iwate')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=3'
        end
        it 'change the page - miyagi' do
          click_link I18n.t('prefectures.index.miyagi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=4'
        end
        it 'change the page - akita' do
          click_link I18n.t('prefectures.index.akita')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=5'
        end
        it 'change the page - yamagata' do
          click_link I18n.t('prefectures.index.yamagata')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=6'
        end
        it 'change the page - fukushima' do
          click_link I18n.t('prefectures.index.fukushima')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=7'
        end
        it 'change the page - ibaraki' do
          click_link I18n.t('prefectures.index.ibaraki')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=8'
        end
        it 'change the page - tochigi' do
          click_link I18n.t('prefectures.index.tochigi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=9'
        end
        it 'change the page - gunma' do
          click_link I18n.t('prefectures.index.gunma')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=10'
        end
        it 'change the page - saitama' do
          click_link I18n.t('prefectures.index.saitama')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=11'
        end
        it 'change the page - chiba' do
          click_link I18n.t('prefectures.index.chiba')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=12'
        end
        it 'change the page - tokyo' do
          click_link I18n.t('prefectures.index.tokyo')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=13'
        end
        it 'change the page - kanagawa' do
          click_link I18n.t('prefectures.index.kanagawa')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=14'
        end
        it 'change the page - niigata' do
          click_link I18n.t('prefectures.index.niigata')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=15'
        end
        it 'change the page - toyama' do
          click_link I18n.t('prefectures.index.toyama')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=16'
        end
        it 'change the page - ishikawa' do
          click_link I18n.t('prefectures.index.ishikawa')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=17'
        end
        it 'change the page - fukui' do
          click_link I18n.t('prefectures.index.fukui')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=18'
        end
        it 'change the page - yamanashi' do
          click_link I18n.t('prefectures.index.yamanashi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=19'
        end
        it 'change the page - nagano' do
          click_link I18n.t('prefectures.index.nagano')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=20'
        end
        it 'change the page - gifu' do
          click_link I18n.t('prefectures.index.gifu')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=21'
        end
        it 'change the page - sizuoka' do
          click_link I18n.t('prefectures.index.sizuoka')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=22'
        end
        it 'change the page - aichi' do
          click_link I18n.t('prefectures.index.aichi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=23'
        end
        it 'change the page - mie' do
          click_link I18n.t('prefectures.index.mie')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=24'
        end
        it 'change the page - siga' do
          click_link I18n.t('prefectures.index.siga')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=25'
        end
        it 'change the page - kyoto' do
          click_link I18n.t('prefectures.index.kyoto')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=26'
        end
        it 'change the page - osaka' do
          click_link I18n.t('prefectures.index.osaka')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=27'
        end
        it 'change the page - hyogo' do
          click_link I18n.t('prefectures.index.hyogo')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=28'
        end
        it 'change the page - nara' do
          click_link I18n.t('prefectures.index.nara')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=29'
        end
        it 'change the page - wakayama' do
          click_link I18n.t('prefectures.index.wakayama')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=30'
        end
        it 'change the page - tottori' do
          click_link I18n.t('prefectures.index.tottori')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=31'
        end
        it 'change the page - shimane' do
          click_link I18n.t('prefectures.index.shimane')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=32'
        end
        it 'change the page - okayama' do
          click_link I18n.t('prefectures.index.okayama')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=33'
        end
        it 'change the page - hiroshima' do
          click_link I18n.t('prefectures.index.hiroshima')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=34'
        end
        it 'change the page - yamaguchi' do
          click_link I18n.t('prefectures.index.yamaguchi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=35'
        end
        it 'change the page - tokushima' do
          click_link I18n.t('prefectures.index.tokushima')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=36'
        end
        it 'change the page - kagawa' do
          click_link I18n.t('prefectures.index.kagawa')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=37'
        end
        it 'change the page - ehime' do
          click_link I18n.t('prefectures.index.ehime')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=38'
        end
        it 'change the page - kochi' do
          click_link I18n.t('prefectures.index.kochi')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=39'
        end
        it 'change the page - fukuoka' do
          click_link I18n.t('prefectures.index.fukuoka')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=40'
        end
        it 'change the page - saga' do
          click_link I18n.t('prefectures.index.saga')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=41'
        end
        it 'change the page - nagasaki' do
          click_link I18n.t('prefectures.index.nagasaki')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=42'
        end
        it 'change the page - kumamoto' do
          click_link I18n.t('prefectures.index.kumamoto')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=43'
        end
        it 'change the page - oita' do
          click_link I18n.t('prefectures.index.oita')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=44'
        end
        it 'change the page - miyazaki' do
          click_link I18n.t('prefectures.index.miyazaki')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=45'
        end
        it 'change the page - kagoshima' do
          click_link I18n.t('prefectures.index.kagoshima')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=46'
        end
        it 'change the page - okinawa' do
          click_link I18n.t('prefectures.index.okinawa')
          uri = URI.parse(current_url)
          expect("#{uri.path}?#{uri.query}").to eq '/ja/prefectures?pref_id=47'
        end
      end
    end
  end
end
