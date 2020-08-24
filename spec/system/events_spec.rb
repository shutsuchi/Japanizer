require 'rails_helper'

describe 'EVENT-TEST', type: :system do
  let(:user){ create(:user) }
  let!(:user2){ create(:another_user) }
  let!(:event){ create(:event, user: user, end: 'Sat, 16 Aug 2019 14:22:84 UTC +00:00') }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

  describe '# SHOW-page-test' do
    context 'check contents' do
      before do
        visit event_path(id: event)
      end
      it 'contains a user_id' do
        expect(page).to have_content event.user.id
      end
      it 'contains a user_name' do
        expect(page).to have_content event.user.name
      end
      it 'contains a title' do
        expect(page).to have_content event.title
      end
      it 'contains a body' do
        expect(page).to have_content event.body
      end
      it 'contains a start-day' do
        expect(page).to have_content event.start
      end
      it 'contains a end-day' do
        expect(page).to have_content event.end
      end
      it 'contains a back-bottun' do
        expect(page).to have_link I18n.t('app.common.back'), href: '/ja/users/' + user.id.to_s
      end
      it 'contains a delete-bottun' do
        expect(page).to have_link I18n.t('app.common.delete'), href: '/ja/events/' + event.id.to_s
      end
    end
    context 'check functions' do
      context 'as an authorized user' do
        before do
          visit event_path(id: event)
        end
        it 'can visit event-show-page' do
          expect(current_path).to eq '/events/' + event.id.to_s
        end
        it 'transit to user_path when click the back bottun' do
          click_link I18n.t('app.common.back')
          expect(current_path).to eq '/ja/users/' + user.id.to_s
        end
        it 'delete event when click button' do
          click_link I18n.t('app.common.delete')
          expect(current_path).to eq '/ja/users/' + user.id.to_s
        end
        it 'transit the page when click button' do
          click_link I18n.t('app.common.delete')
          expect(page).to have_content I18n.t('events.flash.d_notice')
        end
      end
    end
  end

  describe '# INDEX-page-test' do
    context 'check contents' do
      before do
        visit user_path(id: user)
      end
      it 'contains a calentar' do
        expect(page).to have_css '#calendar'
      end
      it 'contains a new-form-title' do
        expect(page).to have_content I18n.t('users.show.new_form')
      end
      it 'contains a title-form' do
        expect(page).to have_field 'event[title]'
      end
      it 'contains a body-form' do
        expect(page).to have_field 'event[body]'
      end
      it 'contians a genre-select-box' do
        expect(page).to have_field 'event[genre_id]'
      end
      it 'contains a start-form' do
        expect(page).to have_field 'event[start]'
      end
      it 'contains a end-form' do
        expect(page).to have_field 'event[end]'
      end
      it 'contains a create-button' do
        expect(page).to have_button 'commit'
      end
    end
    context 'check page-transition' do
      it 'can visit own user-show page' do
        visit user_path(id: user)
        expect(current_path).to eq '/users/' + user.id.to_s
      end
      it 'cannot visit other user-show page' do
        visit user_path(id: user2)
        expect(current_path).to eq '/users/' + user2.id.to_s
      end
    end
    context 'check function of new-form' do
    before do
      visit user_path(id: user)
    end
      it 'create a event successfully' do
        fill_in 'event[title]', with: 'meeting'
        fill_in 'event[body]', with: 'about new project'
        gen_el = find("#event_genre_id > option:nth-child(2)").text
        select(gen_el, from: "event_genre_id")
        fill_in 'event[start]', with: '2020/08/03 12:00'
        fill_in 'event[end]', with: '2020/08/03 14:00'
        click_button 'commit'
        expect(page).to have_content I18n.t('events.flash.s_notice')
        expect(current_path).to eq '/ja/users/' + user.id.to_s
      end
      it 'failed to create event' do
        fill_in 'event[title]', with: ''
        click_button 'commit'
        expect(page).to have_content I18n.t('events.flash.s_alert')
        expect(current_path).to eq '/ja/events'
      end
    end
  end
end
