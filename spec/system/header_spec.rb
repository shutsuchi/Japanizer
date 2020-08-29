require 'rails_helper'

describe 'HEADER-TEST' do
  describe '# common contents on header' do
    before do
      visit top_path
    end
    context 'check contents on header' do
      it 'there is a title' do
        expect(page).to have_content 'Japanizer'
      end
      it 'subtitle' do
        expect(page).to have_content I18n.t('app.header.title_desc')
      end
      it 'local time' do
        expect(page).to have_content I18n.l(Time.zone.now)
      end
      it 'search icon' do
        expect(page).to have_css('#search-icon')
      end
    end
  end
  describe '# when not logged in' do
    before do
      visit top_path
    end
    context 'check locale switcher' do
      it 'En-Locale switcher' do
        expect(page).to have_link 'English', href: '/en?class=fas+fa-flag-usa'
      end
      it 'Ja-Locale switcher' do
        click_link 'English'
        expect(page).to have_link '日本語', href: '/ja?class=far+fa-dot-circle'
      end
    end
    context 'check links on header' do
      it 'Home-link' do
        expect(page).to have_link I18n.t('app.header.home'), href: '/ja'
      end
      it 'About-link' do
        expect(page).to have_link I18n.t('app.header.about'), href: '/ja/about'
      end
      it 'Sign_in-link' do
        expect(page).to have_link I18n.t('app.header.sign_in'), href: '/users/sign_in?locale=ja'
      end
      it 'Sign_up-link' do
        expect(page).to have_link I18n.t('app.header.sign_up'), href: '/users/sign_up?locale=ja'
      end
    end
  end
  describe '# when logged in' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'commit'
    end
    context 'check locale switcher' do
      it 'En-Locale switcher' do
        expect(page).to have_link 'English', href: '/en/users/' + user.id.to_s
      end
      it 'Ja-Locale switcher' do
        click_link 'English'
        expect(page).to have_link '日本語', href: '/ja/users/' + user.id.to_s
      end
    end
    context 'check links on header' do
      it 'Home-link' do
        expect(page).to have_link I18n.t('app.header.home'), href: '/ja'
      end
      it 'MyPage-link' do
        expect(page).to have_link I18n.t('app.header.mypage'), href: '/ja/users/' + user.id.to_s
      end
      it 'About-link' do
        expect(page).to have_link I18n.t('app.header.about'), href: '/ja/about'
      end
      it 'Sign_up-link' do
        expect(page).to have_link I18n.t('app.header.sign_out'), href: '/users/sign_out?locale=ja'
      end
    end
  end
end
