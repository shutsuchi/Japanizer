require 'rails_helper'

describe 'BOOTSTRAP-TEST' do
  let(:user){ create(:user) }
  let!(:post){ create(:post) }
  dscribe '# Grid-system' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'commit'
    end
    context 'user-related pages' do
      it 'show-page' do
        visit user_path(id: user)
        expect(page).to have_selector('.container .row .col-xs-12')
        expect(page).to have_selector('.container .row .col-xs-9')
      end
      it 'edit-page' do
      end
      it 'withdraw-page' do
      end
    end
    context 'post-related pages' do
      it 'index-page' do
      end
      it 'show-page' do
      end
      it 'edit-page' do
      end
    end
    context 'album-related pages' do
      it 'index-page' do
      end
      it 'show-page' do
      end
      it 'edit-page' do
      end
    end
    context 'search-related pages' do
      it 'data page' do
      end
      it 'age-index page' do
      end
      it 'genre-index page' do
      end
      it 'budget-index page' do
      end
      it 'area-index page' do
      end
      it 'search-index page' do
      end
    end
  end
end
