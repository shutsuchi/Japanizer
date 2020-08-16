require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    context 'as an authorized user' do
      let(:user){ create(:user) }
      before do
        sign_in user
        get bookmark_path
      end
      it 'returns a 200 status code' do
        expect(response).to have_http_status(200)
      end
      it 'contains a specific word' do
        expect(response.body).to include(I18n.t('bookmarks.pagetitle'))
      end
    end
    context 'as an guest user' do
      before do
        get bookmark_path
      end
      it 'returns a 302 status code' do
        expect(response).to have_http_status(302)
      end
      it 'redirects the page to /users/sign_in' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST /bookmarks' do
    context 'as an authorized user' do
      before do
        sign_in user
      end
      let(:user){ create(:user) }
      let(:album){ create(:album) }
      let(:bookmark_params){ attributes_for(:bookmark) }
      it 'creates a bookmark' do
        expect do
          post album_bookmarks_path(album_id: album.id), params: { bookmark: bookmark_params }, xhr: true
        end.to change(user.bookmarks, :count).by(1)
      end
    end
  end

  describe 'DELETE /bookmarks/:id' do
    context 'as an authorized user' do
      before do
        sign_in user
        post album_bookmarks_path(album_id: album.id), params: { bookmark: bookmark_params }, xhr: true
      end
      let(:user){ create(:user) }
      let(:album){ create(:album) }
      let(:bookmark){ create(:bookmark) }
      let(:bookmark_params){ attributes_for(:bookmark) }

      it 'deletes a bookmark' do
        expect do
          delete album_bookmarks_path(album_id: album.id), xhr: true
        end.to change(user.bookmarks, :count).by(-1)
      end
    end
  end
end
