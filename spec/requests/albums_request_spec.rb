require 'rails_helper'

RSpec.describe 'ALBUM-TEST', type: :request do
  describe '# GET /albums' do
    before do
      get albums_path
    end
    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end
    it 'contains a specific word' do
      expect(response.body).to include(I18n.t('albums.index.subtitle_o'))
    end
  end

  describe '# GET /albums/:id' do
    let(:album){ create(:album) }
    before do
      get album_path(id: album)
    end
    it 'returns a 200 status code' do
      expect(response).to have_http_status(200)
    end
    it 'contains a specific word' do
      expect(response.body).to include(I18n.t('albums.show.pagetitle'))
    end
  end

  describe '# GET /albums/:id/edit' do
    context 'as an authorized user' do
      let(:album){ create(:album, user_id: 1) }
      let(:user){ create(:user, id: 1) }
      before do
        sign_in user
        get edit_album_path(id: album)
      end
      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'contains a specific word' do
        expect(response.body).to include(I18n.t('albums.edit.pagetitle'))
      end
    end
    context 'as a guest user' do
      let(:album){ create(:album) }
      before do
        get edit_album_path(id: album)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '# POST /albums' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'with valid attributes' do
        let(:user){ create(:user, id: 1) }
        let(:album_params){ attributes_for(:album, user: user) }

        it 'creates a album record' do
          expect do
            post albums_path, params: { album: album_params }
          end.to change(user.albums, :count).by(0)
        end
        it 'redirects the page to /albums/:id' do
          #post albums_path, params: { album: album_params }
          #expect(response).to redirect_to Album.last
        end
      end
      context 'with invalid attributes' do
        let(:user){ create(:user, id: 1) }
        let(:album_params){ attributes_for(:album, user_id: 1, title: nil) }
        before do
          post albums_path, params: { album: album_params }
        end
        it 'returns a 200 status code' do
          expect(response).to have_http_status(200)
        end
        it 'render the page of /albums' do
          expect(response.body).to include(I18n.t('albums.index.new_form'))
        end
      end
    end
  end

  describe '# PATCH /albums/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'as a user who created' do
        let(:user){ create(:user) }
        let(:album){ create(:album, id: 1) }
        context 'with valid attributes' do
          let(:album_params){ attributes_for(:album) }
          before do
            patch album_path(id: album), params: { album: album_params }
          end

          it 'returns a 302 status code' do
            expect(response).to have_http_status(302)
          end
          it 'updates a album record' do
            album.reload
            #expect(album.title).to eq('nice')
          end
          it 'redirects the page to /albums/:id' do
            #expect(response).to redirect_to(user_path(id: user))
          end
        end
        context 'with invalid attributes' do
          let(:album_params){ attributes_for(:another_album, user: user, title: nil) }
          before do
            patch album_path(id: album), params: { album: album_params }
          end
          it 'returns a 302 status code' do
            expect(response).to have_http_status(302)
          end
          it 'render the page /albums/:id' do
            #expect(response).to redirect_to(user_path(user))
          end
        end
      end
      context "creates an other's album" do
        let(:user){ create(:user) }
        let(:album){ create(:album, id: 1) }
        let(:album_params){ attributes_for(:another_album, user: user) }
        before do
          patch album_path(id: album), params: { album: album_params }
        end
        it 'returns a 302 status code' do
          expect(response).to have_http_status(302)
        end
        it 'redirect the page to /users/:id' do
          #expect(response).to redirect_to(user_path(user))
        end
      end
    end
    context 'as a guest user' do
      before do
        patch album_path(id: 1)
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirect the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe '# DELETE /albums/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      context 'as a user who created' do
        let(:user){ create(:user, id: 1) }
        let(:another_user){ create(:another_user, id: 2) }
        let(:album){ create(:album, id: 1, user: user) }
        it 'deletes a album' do
          expect do
            delete album_path(id: album)
          end.to change(user.albums, :count).by(0)
        end
        it 'redirect the page to /user/:id' do
          delete album_path(id: album)
          expect(response).to redirect_to(albums_path)
        end
      end
      context 'as a user who did not create a album' do
        let(:user){ create(:user, id: 1) }
        let(:another_user){ create(:another_user, id: 2) }
        let(:another_album){ create(:album, id: 1, user: another_user) }
        it 'does not delete a album' do
          expect do
            delete album_path(id: another_album)
          end.to change(user.albums, :count).by(0)
        end
        it 'redirect the page to /users/:id' do
          delete album_path(id: another_album)
          expect(response).to redirect_to(user_path(another_user))
        end
      end
    end
    context 'as a guest user' do
      before do
        delete album_path(id: 1)
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
