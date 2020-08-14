require 'rails_helper'

RSpec.describe 'Likes', type: :request do
  describe 'POST /posts/:post_id/likes' do
    context 'as an authorized user' do
      context 'as a user who created' do
        it 'returns a 200 response' do
        end
        it 'updates a like record' do
        end
        it 'redirects the page to /album/:id' do
        end
      end
      context 'as a user who did not create' do
        it 'returns a 302 respose' do
        end
        it 'redirect the page to /users/sign_in' do
        end
      end
    end
    context 'as a guest user' do
      it 'returns a 302 response' do
      end
      it 'redirect the page to /users/sign_in' do
      end
    end
  end

  describe 'DELETE /posts/:post_id/likes' do
    context 'as an authorized user' do
      context 'as a user who created' do
        it 'deletes a album' do
        end
        it 'redirect the page to /user/:id' do
        end
      end
    end
    context 'as a guest user' do
      context 'as a user who created' do
        it 'returns a 302 response' do
        end
        it 'redirect the page to /users/sign_in' do
        end
      end
    end
  end
end
