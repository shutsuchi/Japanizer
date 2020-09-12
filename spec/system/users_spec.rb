require 'rails_helper'

describe 'USER-TEST', type: :system do
  let(:user) { create(:user) }
  let!(:user2) { create(:another_user) }
  let!(:event) { create(:event) }

  describe '# SHOW-page-test' do
    context 'as an authorized user' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_on 'commit'
      end
      context 'visit own user page' do
        before do
          visit user_path(id: user)
        end
        context 'check contents' do
          it 'contains a pagetitle' do
            expect(page).to have_content I18n.t('users.show.pagetitle')
          end
          it 'contains a calendar' do
            expect(page).to have_css '#calendar'
          end
          it 'contains a user-setting' do
            expect(page).to have_content I18n.t('users.show.edit_info')
          end
          it 'contains a user-create-album' do
            expect(page).to have_content I18n.t('users.show.create_album')
          end
          it 'contains a user-create-post' do
            expect(page).to have_content I18n.t('users.show.create_post')
          end
          it 'contains a user-got-status' do
            expect(page).to have_content I18n.t('users.show.got')
          end
          it 'contains a user-gave-status' do
            expect(page).to have_content I18n.t('users.show.gave')
          end
          it 'contains a post-tab-title' do
            expect(page).to have_content I18n.t('activerecord.models.post')
          end
          it 'contains a album-tab-title' do
            expect(page).to have_content I18n.t('activerecord.models.album')
          end
          it 'contains a post-title' do
            expect(page).to have_content I18n.t('users.show.subtitle_p')
          end
          it 'contains a album-title' do
            expect(page).to have_content I18n.t('users.show.subtitle_a')
          end
        end
        context 'check links' do
          it "contains a user's setting link" do
            expect(page).to have_link I18n.t('users.show.edit_info'), href: '/ja/users/' + user.id.to_s + '/edit'
          end
          it 'contains a album-index link' do
            expect(page).to have_link I18n.t('users.show.create_album'), href: '/ja/albums'
          end
          it 'contains a post-index link' do
            expect(page).to have_link I18n.t('users.show.create_post'), href: '/ja/posts'
          end
          it 'contains a bookmark-index link' do
            expect(page).to have_link '0', href: '/ja/bookmarks'
          end
        end
        context 'check functions' do
          context 'page-trangition' do
            it 'transits to edit_user_path' do
              click_link I18n.t('users.show.edit_info')
              expect(current_path).to eq '/ja/users/' + user.id.to_s + '/edit'
            end
            it 'transits to albums_path' do
              click_link I18n.t('users.show.create_album')
              expect(current_path).to eq '/ja/albums'
            end
            it 'transits to posts_path' do
              click_link I18n.t('users.show.create_post')
              expect(current_path).to eq '/ja/posts'
            end
          end
        end
      end
      context "visit other user's page" do
        before do
          visit user_path(id: user2)
        end
        context "transit other user's page" do
          it 'redirect the page to own user page' do
            expect(current_path).to eq '/ja/users/' + user.id.to_s
          end
        end
      end
    end
    context 'as a guest user' do
      before do
        visit user_path(id: 1)
      end
      context 'transit to user_path' do
        it 'redirect the page to new_user_session_path' do
          expect(current_path).to eq '/users/sign_in'
        end
      end
    end
  end

  describe '# EDIT-page-test' do
    context 'as authorized user' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_on 'commit'
      end
      context 'visit own edit_user_path' do
        before do
          visit edit_user_path(id: user)
        end
        context 'check contents' do
          it 'contains a pagetitle' do
            expect(page).to have_content I18n.t('users.edit.pagetitle')
          end
          it 'contains a user-name-field' do
            expect(page).to have_content I18n.t('users.common.name')
          end
          it 'contains a user-age-field' do
            expect(page).to have_content I18n.t('users.common.age')
          end
          it 'contains a user-nation-field' do
            expect(page).to have_content I18n.t('users.common.nation')
          end
          it 'contains a user-email-field' do
            expect(page).to have_content I18n.t('users.common.email')
          end
          it 'contains a user-created_at-field' do
            expect(page).to have_content I18n.t('users.common.created')
          end
          it 'contains a user-name' do
            expect(page).to have_content user.name
          end
          it 'contains a user-age' do
            expect(page).to have_content user.age
          end
          it 'contains a user-nation' do
            expect(page).to have_content user.country_code
          end
          it 'contains a user-email' do
            expect(page).to have_content user.email
          end
          it 'contains a user-created_at' do
            expect(page).to have_content user.created_at.strftime('%Y/%m/%d')
          end
        end
        context 'check links' do
          it 'contains a link of mypage' do
            expect(page).to have_link I18n.t('users.edit.back'), href: '/ja/users/' + user.id.to_s
          end
          it 'contains a link of withdraw page' do
            expect(page).to have_link I18n.t('users.edit.withdraw_btn'), href: '/ja/users/' + user.id.to_s + '/withdraw'
          end
        end
        context 'check functions' do
          context 'when click the link of other pages' do
            it 'transits to the page of mypage' do
              click_link I18n.t('users.edit.back'), match: :first
              expect(current_path).to eq '/ja/users/' + user.id.to_s
            end
            it 'transits to the page of withdraw' do
              click_link I18n.t('users.edit.withdraw_btn')
              expect(current_path).to eq '/ja/users/' + user.id.to_s + '/withdraw'
            end
          end
          context 'when update a user info' do
            it 'update info successfully' do
              fill_in 'user[name]', with: 'Micheal'
              click_on 'commit'
              expect(current_path).to eq '/ja/users/' + user.id.to_s
              expect(page).to have_content I18n.t('users.show.pagetitle')
            end
            it 'failed to update info' do
              fill_in 'user[name]', with: ''
              click_on 'commit'
              expect(current_path).to eq '/ja/users/' + user.id.to_s
              expect(page).to have_content I18n.t('app.error.er_text_3')
            end
          end
        end
      end
      context "visit other user's edit_user_path" do
        before do
          visit user_path(id: user2)
        end
        context 'transit to edit_user_path' do
          it 'redirets the page to own user_path' do
            expect(current_path).to eq '/ja/users/' + user.id.to_s
          end
        end
      end
    end
    context 'as a guest user' do
      before do
        visit edit_user_path(id: 1)
      end
      context 'transit to edit_user_path' do
        it 'redirects the page to new_user_session_path' do
          expect(current_path).to eq '/users/sign_in'
        end
      end
    end
  end

  describe '# WITHDRAW-page-test' do
    context 'as authorized user' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_on 'commit'
      end
      context 'visit own withdraw_path' do
        before do
          visit withdraw_path(user_id: user)
        end
        context 'check contents' do
          it 'contains confirm text1' do
            expect(page).to have_content I18n.t('users.withdraw.text1')
          end
          it 'contains confirm text2' do
            expect(page).to have_content I18n.t('users.withdraw.text2')
          end
          it 'contains confirm text3' do
            expect(page).to have_content I18n.t('users.withdraw.text3')
          end
          it 'contains confirm text4' do
            expect(page).to have_content I18n.t('users.withdraw.text4')
          end
          it 'contains confirm text_bold' do
            expect(page).to have_content I18n.t('users.withdraw.text_bold')
          end
        end
        context 'check links' do
          it 'contains a link of back to mypage' do
            expect(page).to have_link I18n.t('users.withdraw.btn1'), href: '/ja/users/' + user.id.to_s
          end
        end
        context 'check functions' do
          context 'when withdraw button clicked' do
            it 'update withdraw_flag to true' do
              click_on I18n.t('users.withdraw.btn2')
              expect(current_path).to eq '/users/' + user.id.to_s + '/withdraw'
              expect(page).to have_content I18n.t('app.common.confirm')
              # expect(user.withdrawal_flag).to eq false
            end
          end
        end
      end
      context "visit other user's withdraw_path" do
        before do
          visit withdraw_path(user_id: user2)
        end
        it 'redirects the page to own mypage' do
          expect(current_path).to eq '/ja/users/' + user.id.to_s
        end
      end
    end
    context 'as a guest user' do
      before do
        visit withdraw_path(user_id: 1)
      end
      it 'redirects the page to new_user_session_path' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end
end
