require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user, id: 1) }
      let(:another_user){ create(:another_user, id: 2) }

      context 'request own user page' do
        before do
          get user_path(id: user)
        end
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'contains a specific word' do
          expect(response.body).to include(I18n.t('users.show.pagetitle'))
        end
      end
      context 'request other users page' do
        before do
          get user_path(id: another_user)
        end
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to own /users/:id' do
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as an guest user' do
      before do
        get user_path(id: user)
      end
      let(:user){ create(:user) }
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /users/:id/edit' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:another_user){ create(:another_user) }
      context 'request own user page' do
        before do
          get edit_user_path(id: user)
        end
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'contains a specific word' do
          expect(response.body).to include(I18n.t('users.edit.pagetitle'))
        end
      end
      context 'request other users page' do
        before do
          get edit_user_path(id: another_user)
        end
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to own /users/:id' do
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as an guest user' do
      before do
        get user_path(id: user)
      end
      let(:user){ create(:user) }
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /users/:user_id/withdraw' do
    context 'as an authorized user' do
      let(:user){ create(:user) }
      let(:another_user){ create(:another_user) }
      context 'request own user page' do
        before do
          sign_in user
          get withdraw_path(user_id: user)
        end
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'contains a specific word' do
          expect(response.body).to include(I18n.t('users.withdraw.text1'))
        end
      end
      context "request other's page" do
        before do
          sign_in user
          get withdraw_path(user_id: another_user)
        end
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to own /user/:id' do
          expect(response).to redirect_to(user_path(id: user))
        end
      end
    end
    context 'as an guest user' do
      before do
        get user_path(id: user)
      end
      let(:user){ create(:user) }
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH /users/:user_id/switch' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'updates own settings' do
        let(:user){ create(:user) }
        let(:another_user){ create(:another_user) }
        context 'with valid attributes' do
          let(:user_params){ attributes_for(:user) }
          it 'returns a 302 status code' do
            patch switch_path(user_id: user), params: { user: user_params }
            expect(response).to have_http_status(302)
          end
          it 'updates a user record' do
            expect do
              patch switch_path(user_id: user), params: { user: user_params }
            end.to change{ user.withdrawal_flag }.from(false).to(true)
          end
          it 'redirects the page to /top' do
            patch switch_path(user_id: user), params: { user: user_params }
            expect(response).to redirect_to(top_path)
          end
        end
        context 'with invalid attributes' do
          before do
            patch switch_path(user_id: user), params: { user: user_params }
          end
          let(:user_params){ attributes_for(:user, withdrawal_flag: nil) }
          it 'returns a 302 status code' do
            expect(response).to have_http_status(302)
          end
          it 'render the page /top' do
            expect(response).to redirect_to(top_path)
          end
        end
      end
      context "updates other's settings" do
        before do
          patch switch_path(user_id: another_user)
        end
        let(:user){ create(:user) }
        let(:another_user){ create(:another_user) }
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to own /users/:id' do
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 status code' do
        patch switch_path(user_id: 1)
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /uses/sign_in' do
        patch switch_path(user_id: 1)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PATCH /users/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:another_user){ create(:another_user) }
      context 'own settings' do
        context 'with valid attributes' do
          let(:user_params){ attributes_for(:user, name: 'Ichiro Tanaka') }
          it 'returns a 302 status code' do
            patch user_path(id: user), params: { user: user_params }
            expect(response).to have_http_status(302)
          end
          it 'updates a user record' do
            expect do
              patch user_path(id: user), params: { user: user_params }
            end.to change{ user.name }.from('Tanaka Taro').to('Ichiro Tanaka')
          end
          it 'redirects the page to /users/:id' do
            patch user_path(id: user), params: { user: user_params }
            expect(response).to redirect_to(user_path(user))
          end
        end
        context 'with invalid attributes' do
          let(:user_params){ attributes_for(:user, name: nil) }
          it 'returns a 200 status code' do
            patch user_path(id: user), params: { user: user_params }
            expect(response).to have_http_status(200)
          end
          it 'render the page /users/:id' do
            patch user_path(id: user), params: { user: user_params }
            expect(response.body).to include(I18n.t('users.edit.pagetitle'))
          end
        end
      end
      context "other's settings" do
        before do
          patch user_path(id: another_user), params: { user: another_user_params }
        end
        let(:another_user_params){ attributes_for(:another_user) }
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirects the page to /users/:id' do
          expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as a guest user' do
      before do
        patch user_path(id: 1)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
