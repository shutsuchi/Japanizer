require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /event/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:event){ create(:event, user: user,
                                  start: 'Sat, 15 Aug 2020 08:09:17 +0000',
                                  end: 'Sat, 15 Aug 2020 12:09:17 +0000') }
      let(:another_user){ create(:another_user) }
      let(:another_user_event){ create(:another_event, user: another_user) }

      context 'request own event page' do
        before do
          get event_path(id: event)
        end
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'contains a specific word' do
          expect(response.body).to include(I18n.t('events.show.title'))
        end
      end
      context "request an other's event page" do
        before do
          get event_path(id: another_user_event)
        end
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to /top' do
          expect(response).to redirect_to(top_path)
        end
      end
    end
    context 'as an guest user' do
      before do
        get event_path(id: event)
      end
      let(:event){ create(:event) }
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to top' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  describe 'POST /events' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:genre){ create(:genre) }
      let(:user){ create(:user) }
      let(:another_user){ create(:another_user) }
# -------------------------------- NO transcation -----------------------------#
# Unkown
      context 'with valid attributes' do
        let(:event){ create(:event) }
        let(:event_params){ attributes_for(:event) }
        it 'returns a 200 status code' do
          post events_path, params: { event: event_params }
          expect(response).to have_http_status(200)
        end
        it 'creates a event record' do
          expect do
            post events_path, params: { event: event_params }
          end.to change(user.events, :count).by(1)
        end
        it 'redirects the page to /users/:id' do
          post events_path, params: { event: event_params }
          expect(response).to redirect_to(event_path(event))
        end
      end
# ------------------------------- NO transcation(end) -----------------------------#
      context 'with invalid attributes' do
        before do
          post events_path, params: { event: event_params }
        end
        let(:event_params){ attributes_for(:event,
                                          genre: genre,
                                           user: another_user,
                                          start: 'Sat, 15 Aug 2020 08:09:17 +0000',
                                            end: 'Sat, 15 Aug 2020 08:09:17 +0000') }
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'contains a specific word' do
          expect(response.body).to include(I18n.t('users.show.pagetitle'))
        end
      end
    end
    context 'as a guest user' do
      before do
        post events_path, params: { event: event_params }
      end
      let(:event_params){ attributes_for(:event) }
      it 'returns a 302 response' do
        expect(response).to have_http_status(302)
      end
    end
  end

  ###  編集機能は未実装のため下記テストは保留
  #describe 'PATCH /events/:id' do
  #  context 'as an authorized user' do
  #    before do
  #      sign_in user
  #    end
  #    let(:user){ create(:user) }
  #    let(:another_user){ create(:another_user) }
  #    let(:event){ create(:event) }
  #    let(:another_user_event){ create(:another_event) }
  #    context 'updates own event' do
  #      context 'with valid attributes' do
  #        let(:event_params){ attributes_for(:event,
  #                                           body: 'meeting',
  #                                            end: 'Sat, 15 Aug 2020 08:09:17 +0000') }
  #        it 'returns a 302 response' do
  #          patch event_path(id: event), params: { event: event_params }
  #          expect(response).to have_http_status(302)
  #        end
  #        it 'updates a event record' do
  #          expect do
  #            patch event_path(id: event), params: { event: event_params }
  #          end.to change{ event.reload.body }.from('coding').to('meeting')
  #        end
  #        it 'redirects the page to /events/:id' do
  #          patch event_path(id: event), params: { event: event_params }
  #          expect(response).to redirect_to(event_path(event))
  #        end
  #      end
  #      context 'with invalid attributes' do
  #        let(:event_params){ attributes_for(:event, title: nil) }
  #        it 'returns a 200 response' do
  #          patch event_path(id: event), params: { event: event_params }
  #          expect(response).to have_http_status(200)
  #        end
  #        it 'render the page /users/:id' do
  #          patch event_path(id: event), params: { event: event_params }
  #          expect(response.body).to include(I18n.t('users.show.pagetitle'))
  #        end
  #      end
  #    end
  #    context "udpates other's event" do
  #      before do
  #        patch event_path(id: another_user_event), params: { event: another_user_event,
  #                          genre: genre,
  #                           user: another_user,
  #                          start: 'Sat, 15 Aug 2020 08:09:17 +0000',
  #                            end: 'Sat, 15 Aug 2020 08:09:17 +0000' }
  #      end
  #      let(:another_user_evnet){ create(:another_event) }
  #    end
  #  end
  #  context 'as a guest user' do
  #    it 'returns a 302 response' do
  #    end
  #    it 'redirect the page to /sign_in' do
  #    end
  #  end
  #end

  describe 'DELETE /events/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'own event' do
        let(:user){ create(:user) }
        let(:event){ create(:event, user: user) }
        it 'deletes a event record ' do
          expect do
            delete event_path(id: event)
          end.to change(Event, :count).by(-1)
        end
        it 'redirect the page to /user/:id' do
            delete event_path(id: event)
            expect(response).to redirect_to(user_path(user))
        end
      end
      context "other's event" do
        let(:user){ create(:user) }
        let(:another_user){ create(:another_user) }
        let(:event){ create(:event, user: another_user) }
        it 'deletes a event record' do
        end
      end
    end
    context 'as a guest user' do
      before do
        delete event_path(id: 1)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
