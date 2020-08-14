require 'rails_helper'

RSpec.describe 'Bookmarks', type: :request do
  describe 'GET /bookmarks' do
    context 'as an authorized user' do
      it 'returns a 200 response' do
      end
      it 'contains a specific word' do
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirects the page to /users/sign_in' do
      end
    end
  end

  describe 'POST /bookmarks' do
    context 'as an authorized user' do
      it 'creates a bookmark' do
      end
    end
    context 'as an guest user' do
      it 'returns a 302 response' do
      end
      it 'redirects the page to /users/sign_in' do
      end
    end
  end

  describe 'DELETE /bookmarks/:id' do
    context 'as an authorized user' do
      it 'deletes a bookmark' do
      end
      it 'render the page back' do
      end
    end
    context 'as an guest user' do
      it 'does not delete bookmark' do
      end
      it 'redirects the page to users/sign_in' do
      end
    end
  end
end
